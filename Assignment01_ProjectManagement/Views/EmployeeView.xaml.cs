using Assignment01_ProjectManagement.ViewModels;
using ProjectManagement_BusinessObjects.Entites;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace Assignment01_ProjectManagement.Views
{
    /// <summary>
    /// Interaction logic for EmployeeView.xaml
    /// </summary>
    public partial class EmployeeView : UserControl
    {
        private readonly IEmployeeService _employeeService = null;
        public EmployeeView()
        {
            InitializeComponent();
            _employeeService = new EmployeeService();
            dtgEmployee.ItemsSource = _employeeService.GetEmployees();
        }

        private void btn_Add_Click(object sender, RoutedEventArgs e)
        {
            EmployeeUpsert page = new EmployeeUpsert();
            page.InsertOrUpdate = true;
            page.ShowDialog();
            dtgEmployee.ItemsSource = _employeeService.GetEmployees();
        }

        private void btn_Delete_Click(object sender, RoutedEventArgs e)
        {
            Employee project = (Employee)dtgEmployee.SelectedItem;

            if (MessageBox.Show("Are you sure you want to delete?", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                _employeeService.Delete(project.Id);
                dtgEmployee.ItemsSource = _employeeService.GetEmployees();
            }
        }

        private void btn_Edit_Click(object sender, RoutedEventArgs e)
        {
            EmployeeUpsert page = new EmployeeUpsert();
            page.InsertOrUpdate = false;
            page.EmployeeInfo = (Employee)dtgEmployee.SelectedItem;
            page.ShowDialog();
            dtgEmployee.ItemsSource = _employeeService.GetEmployees();
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txtVisa.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            dtgEmployee.ItemsSource = _employeeService.GetEmployees();
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            string visa = txtVisa.Text.Trim();
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();

            dtgEmployee.ItemsSource = _employeeService.GetSearchEmployees(visa, firstName, lastName);
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            if (ApplicationUser.Role == "Staff")
            {
                gbOperator.Visibility = Visibility.Collapsed;
            }
        }
    }
}
