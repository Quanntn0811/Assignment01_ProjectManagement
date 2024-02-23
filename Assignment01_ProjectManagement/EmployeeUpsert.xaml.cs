using Microsoft.EntityFrameworkCore.Infrastructure;
using ProjectManagement_BusinessObjects.Entites;
using ProjectManagement_DAO;
using ProjectManagement_Service;
using ProjectManagement_Service.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace Assignment01_ProjectManagement
{
    /// <summary>
    /// Interaction logic for EmployeeUpsert.xaml
    /// </summary>
    public partial class EmployeeUpsert : Window
    {
        private readonly IEmployeeService _employeeService = null;
        public bool InsertOrUpdate { get; set; }
        public Employee EmployeeInfo { get; set; }
        public EmployeeUpsert()
        {
            InitializeComponent();
            _employeeService = new EmployeeService();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            if (!InsertOrUpdate)
            {
                txtVisa.Text = EmployeeInfo.Visa.ToString();
                txtFirstName.Text = EmployeeInfo.FirstName.ToString();
                txtLastName.Text = EmployeeInfo.LastName.ToString();
                dtpkBirthday.Text = EmployeeInfo.Birthday.ToString();
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txtVisa.Text.Trim() == "" || txtFirstName.Text.Trim() == ""
                  || txtLastName.Text.Trim() == "" || dtpkBirthday.Text.Trim() == "")
            {
                MessageBox.Show("Please fill all the areas");
            }
            else if (InsertOrUpdate)
            {
                AddEmployee();
            }
            else
            {
                UpdateEmployee();
            }
        }

        private void AddEmployee()
        {
            try
            {
                Employee em = new Employee();

                em.Visa = txtVisa.Text;
                em.FirstName = txtFirstName.Text;
                em.LastName = txtLastName.Text;
                em.Birthday = Convert.ToDateTime(dtpkBirthday.Text);

                _employeeService.AddNew(em);
                MessageBox.Show("Add employee Successfully");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void UpdateEmployee()
        {
            try
            {
                Employee em = new Employee();

                em.Visa = txtVisa.Text;
                em.FirstName = txtFirstName.Text;
                em.LastName = txtLastName.Text;
                em.Birthday = Convert.ToDateTime(dtpkBirthday.Text);

                _employeeService.Update(EmployeeInfo.Id, em);
                MessageBox.Show("Update Employee Successfully");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to close?", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Close();
            }
        }

      
    }

}

