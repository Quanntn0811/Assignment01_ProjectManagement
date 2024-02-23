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
using System.Windows.Shapes;

namespace Assignment01_ProjectManagement
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        private readonly IUserService _userService = null;
        public Login()
        {
            InitializeComponent();
            _userService = new UserService();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            if ((txtEmail.Text.Trim() == "") || (txtPassword.Password.Trim() == ""))
            {
                MessageBox.Show("Please fill in the UserNo or Password");
            }
            else
            {
                try
                {
                    User user = _userService.Login(txtEmail.Text, txtPassword.Password);
                    ApplicationUser.Role = user.Role; 

                    if (ApplicationUser.Role == "Admin")
                    {
                        this.Visibility = Visibility.Collapsed;
                        MainWindow main = new MainWindow();
                        main.ShowDialog();
                    } 
                    else if (ApplicationUser.Role == "Staff")
                    {
                        this.Visibility = Visibility.Collapsed;
                        MainWindow main = new MainWindow();
                        main.ShowDialog();
                    }
                    else
                    {
                        MessageBox.Show("You dont have permission to log in");
                    }
                   
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to exit?", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }

        }
    }
}
