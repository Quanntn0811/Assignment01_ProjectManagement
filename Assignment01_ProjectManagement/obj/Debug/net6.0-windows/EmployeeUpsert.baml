   M S B A M L   `   `   `  ����Y  UAssignment01_ProjectManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullO,clr-namespace:Assignment01_ProjectManagementAssignment01_ProjectManagement  5   	   3    -Assignment01_ProjectManagement.EmployeeUpsert   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   >local,clr-namespace:Assignment01_ProjectManagement     5   	   -   5          � Title$  EmployeeUpsert��5   	   $	��352��6    $	��658��6-   .��5	      � $��0,0,0,-6q�6    � ColumnDefinitions 5
   
   �� 5      $	��52* �6   �� 5      $
��130* �6   �� 5      $	��46* �6   �� 5      $	��75* �6   �� 5      $
��243* �6   �� 5      $	��64* �6    � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      �� 5      .+�5   
   �� $
��Visa��6   $
��Left=�6   $	��Top=�6:   $��1��6R   $��0,16,0,0q�6b   �� 5   
   -   5        $��txtVisa��5   "   $��3��6    �� TextWrapping$
 Wrap=�61   $��Center=�6E   $��26��6`   $��0,0,20,0q�6l   $��3��6~   �� 5   
   $��
First Name��6   $��1��6%   $
��Left=�62   $	��Top=�6M   $��1��6e   $��0,16,0,0q�6u   �� 5   
   -   5        $��txtFirstName��5   "   $��3��6   $��1��66   $
 Wrap=�6C   $��Center=�6W   $��26��6r   $��0,0,20,0q�6~   $��3��6�   �� 5   
   $��	Last Name��6   $��2��6$   $
��Left=�61   $	��Top=�6L   $��1��6d   $��0,16,0,0q�6t   �� 5   
   -   5        $��txtLastName��5   "   $��3��6   $��2��65   $
 Wrap=�6B   $��Center=�6V   $��26��6q   $��0,0,20,0q�6}   $��3��6�   �� 5    
   $��Birthday��6   $��3��6#   $
��Left=�60   $	��Top=�6K   $��1��6c   $��0,16,0,0q�6s   (  "System.Windows.Controls.DatePicker  5!   
   -   5        $��dtpkBirthday��5!   %   $��3��6   $��3��69   $��Center=�6F   $��26��6a   $��0,0,20,0q�6m   $��3��6   �� 5#   
   -   5         ��Name$ btnSave��5#      $
��Save��6"   $��4��61   $
��Left=�6>   $��	71,7,0,16q�6Y   $	��140��6l   $��3��6x   $��1��6�   6�   �� 5$   
   -   5        $ btnClose��5$      $��Close��6#   $��4��63   $��4��6C   $
��Left=�6P   $��	45,7,0,17q�6k   $	��140��6~   6�   5&      5'      