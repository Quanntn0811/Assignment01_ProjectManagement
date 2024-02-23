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

namespace Assignment01_ProjectManagement.Views
{
    /// <summary>
    /// Interaction logic for GroupView.xaml
    /// </summary>
    public partial class GroupView : UserControl
    {
        private readonly IGroupService _groupService = null;
        private readonly IEmployeeService _employeeService = null;
        public GroupView()
        {
            InitializeComponent();
            _groupService = new GroupService();
            _employeeService = new EmployeeService();

            cbGroupLeader.ItemsSource = _employeeService.GetEmployeeName();
            cbGroupLeader.DisplayMemberPath = "Label";
            cbGroupLeader.SelectedValuePath = "Value";
            dtgGroup.ItemsSource = _groupService.GetGroups().Select(x => new
            {
                Identity = x.Id,
                GroupLeader = x.GroupLeader.FirstName + " " + x.GroupLeader.LastName,
            }); ;
        }

        private void btn_Delete_Click(object sender, RoutedEventArgs e)
        {
            Group group = (Group)dtgGroup.SelectedItem;

            if (MessageBox.Show("Are you sure you want to delete?", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                _groupService.Delete(group.Id);
                dtgGroup.ItemsSource = _groupService.GetGroups();
            }
        }

        private void btn_Add_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Group group = new Group();

                group.GroupLeaderId = Convert.ToInt32(cbGroupLeader.SelectedValue);

                _groupService.AddNew(group);
                MessageBox.Show("Add employee Successfully");
                dtgGroup.ItemsSource = _groupService.GetGroups();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            if (ApplicationUser.Role == "Staff")
            {
                gbOperator.Visibility = Visibility.Collapsed;
                dtgGroup.Margin = new Thickness(0, 0, 0, 0);
                dtgGroup.Height = 500;
            }
        }
    }
}
