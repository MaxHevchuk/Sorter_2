   M S B A M L   `   `   `  ����A  =Sorter, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:Sorter.localizationSorter.localization  5   	       Sorter.MenuWindow   5   	   R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:Sorter.localization     5   	      MinWindowHeight#��[  5   	     MinWindowWidth#��[ 5	   	   #   Sorter.localization.resources    Title � Title# Z  5
   	   $	��500��5   	   $	��850��6    � Icon$ res/icons/icon_sorter.ico��5   	    � 	Resources 5        FullscreenOut  FullscreenIn��%�   &	       &	 ;     �� 5   
   $'��!res/icons/icon_fullscreen_out.png��6&   �� 5   
   $#��res/icons/icon_fullscreen.png��6%   5      .��5      � .+�5   
   � -   5         �Name$
 Base��5       � ColumnDefinitions 5      �� 5      -   5         ��Name$ LeftCol��5   #   $��2* �64   �� 5      -   5        $ 	CenterCol��5   #   $
��1.5* �66   �� 5      -   5        $ RightCol��5   #   $��2* �65   .+�5      ]� -   5         ]�Name$ InputWin��5      $��0��5      $
��True��5      .+�5       ]� -   5        $ LeftControlMenu��5!      $	��Top=�5"        DarkGreyColor#��[ 5#      $��False��5$      .+�5%      �� -   5         ��Name$ TopLeftText��5&      $
��Left=�5'        TopBottomLabelStyle#��[ 5(      	   
InputLabel#��Z	 5)      �� 5*      -   5        
 ��Name$
 LeftFullScreenButt��5*        ImageButtonStyle#��[ 5,      $��Right=�5-      .��5.      �� $#��res/icons/icon_fullscreen.png��6    5/      �� 50      -	   5        $
 LeftCopyButt��50      #��[ 52      $��Right=�53      .��54      �� $��res/icons/icon_copy.png��6    55      �� 56      -
   5        $
 LeftClearButt��56      #��[ 58      $��Right=�59      .��5:      �� $��res/icons/icon_clear.png��6    5;      �� 5<      -   5        $
 LeftSaveButt��5<      #��[ 5>      $��Right=�5?      .��5@      �� $��res/icons/icon_save.png��6    5A      �� 5B      -   5        $
 LeftOpenButt��5B      #��[ 5D      $��Right=�5E      .��5F      �� $��res/icons/icon_open.png��6    5G      �� 5H      -   5        $
 SampleButton��5H      $��Right=�5J      
������ 
������ 
�������   SampleLabel#��Z 5N      $��Italic$�5O      5P      � 5R      -   5        $ BottomPanelInputWin��5R      $��Bottom=�5S      #��[ 5T      .+�5U      �� -   5        $
 ChangeLanguageButton��5U      
������ $��0q�5W      $��30��5X      $
��Left=�5Y      .��5[      �� $"��res/icons/icon_ua_or_usa.jpg��6    $��30��6F   $��20��6Q   5\      �� 5]      $�� ��6    $y�Hidden=�6)   $��Italic$�6=   $��Right=�6P   5_      �� 5a      -   5         ��Name$ 	InputText��5a       �� TextWrapping$
 Wrap=�5b      " �� VerticalScrollBarVisibility$
 Auto=�5c       �� AcceptsReturn$
 True��5d      5e      ]� 5h      -   5        $ 	OptionWin��5i      $��1��5j      
�������$
��True��5l      .+�5n      �� $	��Top=�5o        PanelHeight#��[ 5p      #��[ 5q        ZeroZeroTenTenCorner �� CornerRadius# [ 5r      ._�5t      ��    SettingsText#��Z 5u      $��Italic$�5v       	 SettingsTextFontSize#��[	 5w      
�������$��Center=�5y      $��Center=�5z      5{      �� 5}      $��Bottom=�5~      #��[ 5       
 ZeroFiveTwoZerosMargin#��[
 5�        TenTenZeroZeroCorner# [ 5�      ._�5�      �� $��Stretch=�5�      #��[ 5�      .+�5�      �� -   5        $ CopyToClipboardText��5�   $      CopyClipboardMessage#��Z 5�   $     StatusBottomTextStyle#��[ 5�   $   �� 5�      -   5        $ SaveFileText��5�   $      FileSaveText#��Z 5�   $   #��[ 5�   $   5�      5�      �� 5�      
�������
�������$��1q�5�        FourTensCorner# [ 5�        FourFivesMargin#��[ 5�      ._�5�      �� $
��Auto=�6#   $
��True��5�   #   .��5�      �� .+�5�      ��  �� Orientation$ 
Horizontal=�5�   !   $��Center=�5�   !     FourTensMargin#��[ 5�   !   .+�5�   "   	� -   5         	�Name$ AscendingRadioButt��5�   .    	� 	GroupName$ 	direction��5�   .      	Ascending#��Z 5�   .    d� 	IsChecked$
 TrueY�5�   .     OOTwentyFiveOMargin#��[ 5�   .   	� 5�   "   -   5        $ DescendingRadioButt��5�   .   $ 	direction��5�   .      
Descending#��Z 5�   .   5�      �� 5�      -   5         ��Name$ TypeComboBox��5�   '   $��Stretch=�5�   '   #��[ 5�   '   .@�5�   "   �� -   5         ��Name$ EngComboBox��5�   /    �� 
IsSelected$
 True��5�   /      EnglishLettersRationBut#��Z 5�   /   �� 5�   "   -   5        $ 
UaComboBox��5�   /       UkrainianLettersRationBut#��Z 5�   /   �� 5�   "   -   5        $ BinComboBox��5�   /      BinaryNumRatioBut#��Z 5�   /   �� 5�   "   -   5        $ DecComboBox��5�   /       DecimalNumRationBut#��Z  5�   /   �� 5�   "   -   5        $ HexComboBox��5�   /   !   HexadecimalNumRatioBut#��Z! 5�   /   �� 5�   "   -   5        $ LenComboBox��5�   /   "   LengthWordRatioBut#��Z" 5�   /   5�      �� 5�      -   5        # ��Name$# IgnoreDuplicateCheckBox��5�   !   $ FalseY�5�   !   $ d� IsThreeState$$ False��5�   !   %   IgnoreDuplicateCheckBox#��Z% 5�   !   $��Center=�5�   !   #��[ 5�   !   �� 5�      -   5        $ MethodComboBox��5�   '   $��Stretch=�5�   '   #��[ 5�   '   .@�5�   "   �� -   5        $ BubbleComboBox��5�   /   $
 True��5�   /   &   BubbleRadioBut#��Z& 5�   /   �� 5�   "   -    5        $ CocktailComboBox��5�   /   '   CocktailRadioBut#��Z' 5�   /   �� 5�   "   -!   5        $ InsertionComboBox��5�   /   (   InsertionRadioBut#��Z( 5�   /   �� 5�   "   -"   5        $ MergeComboBox��5�   /   )   MergeRadioBut#��Z) 5�   /   �� 5�   "   -#   5        $ SelectionComboBox��5�   /   *   SelectionRadioBut#��Z* 5�   /   5�      �� 5�      -$   5        $
 
SortButton��5�   !   +   
SortButton#��Z+ 5�   !     SortButtonFontSize#��[ 5�   !   $
��Bold"�5�   !   #��[ 5�   !   $	��2.5q�5�   !     
GreenColor#��[ 5�   !   
������� 5�   "   , �� 
TargetType- �� Property. �� Value��%_   '��       7  �� 5�   &   ", ��6,   .�5�   *   �� - �@��CornerRadius8.   6I   5�   '   5�   #   5�      �� 5�      /   InputSeparatorLabel#��Z/ 5�   !     SeparatorStyle#��[ 5�   !     TenTenZeroTenMargin#��[ 5�   !   �� 5�      -%   5        $ InputSeparatorText��5�   &   $
 Wrap=�5�   &   $
 Auto=�5�   &   $
 True��5�   &   $��Stretch=�5�   &     TenZeroTenTenMargin#��[ 5�   &   �� 5�      0   OutputSeparatorLabel#��Z0 5�   !   #��[ 5�   !   #��[ 5�   !   �� 5�      -&   5        $ OutputSeparatorText��5�   &   $
 Wrap=�5�   &   $
 Auto=�5�   &   $
 True��5�   &   $��Stretch=�5�   &   #��[ 5�   &   5�      5�      5�      5�      ]� 5�      -'   5        $ 	OutputWin��5�      $��2��5�      $
��True��5�      .+�5      ]� -(   5        $ RightControlMenu��5      $	��Top=�5     #��[ 5     $��False��5     .+�5     �� -)   5        $ TopRightLabel��5      $
��Left=�5      #��[ 5      1   OutputLabel#��Z1 5      �� 5	     -*   5        $
 RightFullscreenButt��5	     #��[ 5     $��Right=�5     .��5     �� $#��res/icons/icon_fullscreen.png��6    5     �� 5     -+   5        $
 RightCopyButt��5     #��[ 5     $��Right=�5     .��5     �� $��res/icons/icon_copy.png��6    5     �� 5     -,   5        $
 RightClearButt��5     #��[ 5     $��Right=�5     .��5     �� $��res/icons/icon_clear.png��6    5     �� 5     --   5        $
 RightSaveButt��5     #��[ 5     $��Right=�5     .��5     �� $��res/icons/icon_save.png��6    5      5!     � 5#     -.   5        $ StatisticBar��5#     $��Bottom=�5$     #��[ 5%      5&     �� 5'     �� 5(     �� 5)     .+�5,     �� $��0��5-     $ 
Horizontal=�5.     .+�50     �� -/   5        2 ��Name$2 
LenghtText��50      #��[ 51      3   LengthNumLabel#��Z3 52      �� 53     -0   5        $2 LenghtNumberText��53      $��0��54      #��[ 55        FiveThreeZerosMargin#��[ 56      57     �� 59     $��1��5:     $ 
Horizontal=�5;     $��Center=�5<     .+�5>     �� -1   5        $2 PermutationText��5>      #��[ 5?      4   PermutationLabel#��Z4 5@      �� 5A     -2   5        $2 PermutationNumberText��5A      $��0��5B      #��[ 5C      #��[ 5D      5E     �� 5G     $��2��5H     $ 
Horizontal=�5I     $��Right=�5J     .+�5L     �� -3   5        $2 TimeText��5L      #��[ 5M      5   	TimeLabel#��Z5 5N      �� 5O     -4   5        $2 TimeNumberText��5O      #��[ 5P      $
��0 ms��5Q      #��[ 5R      5S     5U     �� 5W     -5   5        $ 
OutputText��5W     $
 Wrap=�5X     $
 Auto=�5Y     $
 True��5Z     5[     5\     5]     5_     