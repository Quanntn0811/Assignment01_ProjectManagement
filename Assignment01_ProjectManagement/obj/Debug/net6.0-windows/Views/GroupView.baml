   M S B A M L   `   `   `  ����Y  UAssignment01_ProjectManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null[2clr-namespace:Assignment01_ProjectManagement.Views$Assignment01_ProjectManagement.Views  5      4    .Assignment01_ProjectManagement.Views.GroupView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Dlocal2clr-namespace:Assignment01_ProjectManagement.Views     5      -   5        
�������.��5	      � .+�5
   
   �� -   5        $��
gbOperator��5
      $	��173��6&   $��Operator��63   $	��569��6E   $
��Left=�6Q   $	��Top=�6l     �� Left$  10��6�   
 �� Top$ 10��6�   $��	10,23,0,0q�6�   .��5      �� $��	2,10,-2,4q�6   .+�5      �� $��Group Leader��6   $��34��6/   $	��100��6;   $��Center=�6G   $	��Top=�6d   $  16��6|   $ 10��6�   �� 5      -   5        $��cbGroupLeader��5      $��3��60   $��26��6@   $	��Top=�6M   $��2��6e   $	  121��6y   $ 11��6�   $
��Left=�6�   $	��200��6�   �� 5      -   5         ��Name$ btn_Edit��5      $
��Edit��6+   $	  397��6:   $ 47��6L   $��32��6\   $	��114��6h   $��Center=�6t   $	��Top=�6�    J� RenderTransformOrigin$ 0.535,-0.483&�6�   �� 5      -   5        $ 
btn_Delete��5      $��Delete��6-   $	  397��6>   $ 94��6P   $��32��6`   $	��114��6l   $ 0.535,-0.483&�6x   $
��Left=�6�   $	��Top=�6�   6�   �� 5      -   5        $ btn_Add��5      $	��Add��6*   $	  397��68   $��32��6J   $	��114��6V   $ 0.535,-0.483&�6b   $��Center=�6�   $	��Top=�6�   6�   5      5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ dtgGroup��5         AutoGenerateColumns$ False��6%      
IsReadOnly$
 True��6A   $��	0,201,0,0q�6S      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��6%   	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 61   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 6;   �� *
Identity+  5      $ GroupLeaderId��6%   $	 * 6<   
 6F   �� *GroupLeader+5      5      5      