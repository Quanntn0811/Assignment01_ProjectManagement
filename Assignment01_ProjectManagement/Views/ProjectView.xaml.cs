using Assignment01_ProjectManagement.ViewModels;
using ProjectManagement_BusinessObjects.Entites;
using ProjectManagement_Service;
using ProjectManagement_Service.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Assignment01_ProjectManagement.Views
{
    /// <summary>
    /// Interaction logic for ProjectView.xaml
    /// </summary>
    public partial class ProjectView : UserControl
    {
        private readonly IProjectService projectService = null;
        public ProjectView()
        {
            InitializeComponent();
            projectService = new ProjectService();
            dtgProject.ItemsSource = projectService.GetProjects();
            cbStatus.ItemsSource = projectService.GetProjectStatus();
            
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            if (ApplicationUser.Role == "Staff")
            {
                gbOperator.Visibility = Visibility.Collapsed;
            }
            LoadProject();
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txtCustomer.Text = string.Empty;
            txtName.Text = string.Empty;
            txtNumber.Text = string.Empty;
            cbStatus.Text = string.Empty;
            LoadProject();
        }

        private void btn_Add_Click(object sender, RoutedEventArgs e)
        {
            ProjectUpsert page = new ProjectUpsert();
            page.InsertOrUpdate = true;
            page.ShowDialog();
            dtgProject.ItemsSource = projectService.GetProjects();
        }

        private void btn_Edit_Click(object sender, RoutedEventArgs e)
        {
            ProjectUpsert page = new ProjectUpsert();
            page.InsertOrUpdate = false;
            page.ProjectInfo = (Project)dtgProject.SelectedItem;
            page.ShowDialog();
            LoadProject();
        }

        private void LoadProject()
        {
            dtgProject.ItemsSource = projectService.GetProjects();

        }

        private void btn_Delete_Click(object sender, RoutedEventArgs e)
        {
            Project project = (Project) dtgProject.SelectedItem;

            if (MessageBox.Show("Are you sure you want to delete?", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                projectService.Delete(project.Id);
                dtgProject.ItemsSource = projectService.GetProjects();
            }
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            string name = txtName.Text.Trim();
            string customer = txtCustomer.Text.Trim();
            string number = txtNumber.Text.Trim();
            string status = cbStatus.Text.Trim();

            if (number != "")
                if (!int.TryParse(number, out _))
                {
                    MessageBox.Show("Plase enter a number");
                    return;
                }

            dtgProject.ItemsSource = projectService.GetSearchProjects(name, customer, number, status);
        }
    }
}
