   M S B A M L   `   `   `  ����Y  UAssignment01_ProjectManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null[2clr-namespace:Assignment01_ProjectManagement.Views$Assignment01_ProjectManagement.Views  5      6    0Assignment01_ProjectManagement.Views.ProjectView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Dlocal2clr-namespace:Assignment01_ProjectManagement.Views     5      -   5        
�������.��5
      � .+�5   
   �� $	��173��6   $��Search��6    $	��569��60   $
��Left=�6<   $	��Top=�6W     �� Left$  10��6o   
 �� Top$ 10��6�   $��	10,23,0,0q�6�   .��5      �� $��6,10,-6,-10q�6   .+�5      �� $
��Name��6   $��34��6'   $	��100��63   $��Center=�6?   $	��Top=�6\   $  16��6t   $ -4��6�   �� 5      -   5         ��Name$ txtName��5      $��2��6+   $��1��68   $��26��6H   $	  104��6T   $ -4��6f   $
��Left=�6v   $��Center=�6�   $	��235��6�   �� 5      $��Number��6   $��1��6)   $��34��66   $	��100��6B   $��Center=�6N   $	��Top=�6k   $  16��6�   $ 69��6�   �� 5      -   5        $ 	txtNumber��5      $��1��6-    �� TextWrapping$
 Wrap=�6=   $��26��6Q   $	  104��6]   $ 73��6o   $
��Left=�6   $��Center=�6�   $	��235��6�    J� RenderTransformOrigin$ 0.523,0.065&�6�   �� 5      $��Customer��6   $��2��6+   $��34��68   $	��111��6D   $��Center=�6P   $	��Top=�6m   $ 
0.84,1.501&�6�   $  16��6�   $ 30��6�   �� 5      -   5        $ txtCustomer��5      $��1��6/   $��1��6<   $
 Wrap=�6L   $��26��6`   $	  104��6l   $ 34��6~   $
��Left=�6�   $��Center=�6�   $	��235��6�   �� 5      $��Status��6   $��34��6)   $
��auto��65   $��Center=�6B   $	��Top=�6_   $��2��6w   $ 
0.92,0.419&�6�   $��2��6�   $  16��6�   $	 108��6�   �� 5      -   5        $��cbStatus��5      $��3��6+   $��26��6;   $��Center=�6H   $��2��6c   $	  104��6w   $	 109��6�   $
��Left=�6�   $	��235��6�   �� 5      -   5         ��Name$ 	btnSearch��5      $��Search��6,   $��2��6=   $��3��6K   $ 2.078,1.826&�6[   $	  365��6   $ -4��6�   $��34��6�   $��80��6�   $
��Left=�6�   $��Center=�6�   6�   �� 5      -   5        $ btnClear��5      $��Clear��6+   $��2��6;   $
��Left=�6K   $��80��6f   $��2��6q   $��2��6�   $��34��6�   $��Center=�6�   $	  467��6�   $ -4��6�   $ -0.295,0.507&�6�   6   5      5      �� 5   
   -   5        $��
gbOperator��5      $	��173��6%   $��Operator��62   $	��179��6D   $	  587��6P   $ 10��6b   $
��Left=�6r   $	��Top=�6�   $��
597,23,0,0q�6�   .��5      �� $	��127��6   .+�5       �� -	   5        $ btn_Edit��5       $
��Edit��6+   $  32��6:   $ 51��6K   $��32��6[   $	��114��6g   $��Center=�6s   $	��Top=�6�   $ 0.535,-0.483&�6�   6�   �� 5!      -
   5        $ 
btn_Delete��5!      $��Delete��6-   $  32��6>   $ 93��6O   $��32��6_   $	��114��6k   $ 0.535,-0.483&�6w   $��Center=�6�   $	��Top=�6�   6�   �� 5"      -   5        $ btn_Add��5"      $	��Add��6*   $  32��68   $ 8��6I   $��32��6X   $	��114��6d   $ 0.535,-0.483&�6p   $��Center=�6�   $	��Top=�6�   6�   5$      5%      &   System.Windows.Controls.DataGrid  5(   
   -   5          Name$ 
dtgProject��5(         AutoGenerateColumns$ False��6'      
IsReadOnly$
 True��6C   $��	0,201,0,0q�6U   	   Columns	 5)      0  *System.Windows.Controls.DataGridTextColumn  5*      ,  &System.Windows.Controls.DataGridColumn
   Header$
 GroupId��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 66   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *	GroupId+  5+      $
 Number��6%   $ * 65    6?   �� *Number+  5,      $

 Name��6%   $ * 63    6=   �� *Name+  5-      $
 Customer��6%   $ * 67    6A   �� *
Customer+  5.      $
 Status��6%   $ * 65    6?   �� *Status+  5/      $
 	StartDate��6%   $ * 68    6B   �� *	StartDate+  50      $
 EndDate��6%   $ * 66    6@   �� *	EndDate+52      53      54      