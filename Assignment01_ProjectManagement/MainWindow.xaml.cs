using Assignment01_ProjectManagement.ViewModels;
using Assignment01_ProjectManagement.Views;
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

namespace Assignment01_ProjectManagement
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            DataContext = new ProjectViewModel();
        }

        private void MenuItem_Click_1(object sender, RoutedEventArgs e)
        {
            DataContext = new GroupViewModel();
        }

        private void MenuItem_Click_2(object sender, RoutedEventArgs e)
        {
            DataContext = new EmployeeViewModel();
        }

        private void MenuItem_Click_3(object sender, RoutedEventArgs e)
        {
            this.Visibility = Visibility.Collapsed;
            Login login = new Login();
            login.ShowDialog();
        }
    }
}
