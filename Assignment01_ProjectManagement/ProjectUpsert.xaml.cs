using ProjectManagement_Service.interfaces;
using ProjectManagement_Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using ProjectManagement_BusinessObjects.Entites;
using ProjectManagement_DAO;

namespace Assignment01_ProjectManagement
{
    /// <summary>
    /// Interaction logic for ProjectUpsert.xaml
    /// </summary>
    public partial class ProjectUpsert : Window
    {
        private readonly IProjectService _projectService = null;
        private readonly IEmployeeService _employeeService = null;
        public bool InsertOrUpdate { get; set; }
        public Project ProjectInfo { get; set; }

        public ProjectUpsert()
        {
            InitializeComponent();
            _projectService = new ProjectService();
            _employeeService = new EmployeeService();
            cbStatus.ItemsSource = _projectService.GetProjectStatus();
            lbVisa.ItemsSource = _employeeService.GetEmployeeVisa();        
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            if (!InsertOrUpdate)
            {
                txtNumber.IsReadOnly = true;
                txtGroupId.Text = ProjectInfo.GroupId.ToString();
                txtNumber.Text = ProjectInfo.Number.ToString();
                txtName.Text = ProjectInfo.Name.ToString();
                txtCustomer.Text = ProjectInfo.Customer.ToString();
                cbStatus.Text = ProjectInfo.Status.ToString();
                dtpkStartDate.Text = ProjectInfo.StartDate.ToString();
                dtpkEndDate.Text = ProjectInfo.EndDate.ToString();
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txtGroupId.Text.Trim() == "" || txtNumber.Text.Trim() == ""
                  || txtName.Text.Trim() == "" || dtpkStartDate.Text.Trim() == ""
                 || cbStatus.SelectedIndex == -1
                  || dtpkEndDate.Text.Trim() == "")
            {
                MessageBox.Show("Please fill all the areas");
            }
            else if (InsertOrUpdate)
            {
                AddProject();
            } else
            {
                UpdateEmployee();
            }

        }

        private void AddProject()
        {
            bool flag = checkNumber(txtGroupId.Text, txtNumber.Text);

            DateTime startDate = Convert.ToDateTime(dtpkStartDate.Text);
            DateTime endDate = Convert.ToDateTime(dtpkEndDate.Text);

            if (!flag)
            {
                MessageBox.Show("The input is not a number.");
            }
            else if (startDate.CompareTo(endDate) > 0)
            {
                MessageBox.Show("Start Date must earlier than End Date");
            }
            else
            {
                try
                {
                    CreateNewProjectRequest project = new CreateNewProjectRequest();

                    project.GroupId = Convert.ToInt32(txtGroupId.Text);
                    project.Number = Convert.ToInt32(txtNumber.Text);
                    project.Name = txtName.Text;
                    project.Customer = txtCustomer.Text;
                    project.Status = cbStatus.SelectedValue.ToString();

                    project.Employees = new List<string>();
                    foreach (var item in lbVisa.SelectedItems)
                    {
                        project.Employees.Add(item.ToString());
                    }

                    project.StartDate = startDate;
                    project.EndDate = endDate;


                    _projectService.AddNew(project);
                    MessageBox.Show("Add Project Successfully");
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void UpdateEmployee()
        {
            bool flag = checkNumber(txtGroupId.Text, txtNumber.Text);

            DateTime startDate = Convert.ToDateTime(dtpkStartDate.Text);
            DateTime endDate = Convert.ToDateTime(dtpkEndDate.Text);

            if (!flag)
            {
                MessageBox.Show("The input is not a number.");
            }
            else if (startDate.CompareTo(endDate) > 0)
            {
                MessageBox.Show("Start Date must earlier than End Date");
            }
            else
            {
                try
                {
                    UpdateProjectRequest project = new UpdateProjectRequest();

                    project.GroupId = Convert.ToInt32(txtGroupId.Text);
                    project.Name = txtName.Text;
                    project.Customer = txtCustomer.Text;
                    project.Status = cbStatus.SelectedValue.ToString();

                    project.Employees = new List<string>();
                    foreach (var item in lbVisa.SelectedItems)
                    {
                        project.Employees.Add(item.ToString());
                    }

                    project.StartDate = startDate;
                    project.EndDate = endDate;


                    _projectService.Update(ProjectInfo.Id, project);
                    MessageBox.Show("Update Project Successfully");
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
        
        private bool checkNumber(string num1, string num2)
        {
            string pattern = @"[^0-9]";
            Regex regex = new Regex(pattern);
            if (regex.IsMatch(num1) || regex.IsMatch(num2))
            {
                return false;
            }
            return true;
        }

   
    }
}
