﻿using System;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Sorter
{
    public partial class MenuWindow
    {
        private const string PathEnumUa = @"..\..\..\res\sample_str.txt";
        private const string PathEnumNum = @"..\..\..\res\sample_num.txt";

        private string _inputData;
        private string _outputData;
        private string[] _tempArray;
        private DataType? _dataType;
        private SortingMethods _sortingMethod;
        private bool _isInAscendingOrder;
        private bool _isIgnoreDuplicate;
        private string _inputSeparator;
        private string _outputSeparator;
        private long _time;
        private int _permutation;
        private IMethods _sorter;

        private bool _isFullscreen;

        private static Method<int> _methodInt;
        private static Method<string> _methodStr;

        private delegate int Method<T>(ref T[] data, out long time) where T : IComparable<T>;


        public MenuWindow()
        {
            InitializeComponent();
        }

        private MenuWindow(string culture, string data)
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);
            InitializeComponent();
            InputText.Text = data;
        }

        private void BtnSort(object sender, RoutedEventArgs e)
        {
            _inputData = InputText.Text;
            _inputSeparator = (InputSeparatorText.Text.Length == 0) ? " " : InputSeparatorText.Text;
            _outputSeparator = (OutputSeparatorText.Text.Length == 0) ? " " : OutputSeparatorText.Text;

            _isInAscendingOrder =
                AscendingRadioButt.IsChecked != null && (bool) AscendingRadioButt.IsChecked;
            _isIgnoreDuplicate =
                IgnoreDuplicateCheckBox.IsChecked != null && (bool) IgnoreDuplicateCheckBox.IsChecked;


            /* |||||||||||||||||||
            var method = new MethodsAsc();
            var arr = _inputData.Split();
            var array = arr.Select(word => word.Length).ToArray();
            method.BubbleSort(ref array, out _);
            string[] res = new string[arr.Length];

            for (int i = 0; i < res.Length; i++)
            {
                res[i] = Array.Find(arr, word => word.Length == array[i]);
            }

            OutputText.Text = string.Join(' ', res);
            ||||||||||||||||| */

            if (!DataChecker.CheckForCorrect(_inputData, _dataType, _inputSeparator))
            {
                MessageBox.Show("The entered data does not match the selected type.", "Error",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (_sorter != null)
            {
                if (_sorter.GetType() == typeof(MethodsDesc) && _isInAscendingOrder)
                {
                    _sorter = new MethodsAsc();
                }
                else if (_sorter.GetType() == typeof(MethodsAsc) && !_isInAscendingOrder)
                {
                    _sorter = new MethodsDesc();
                }
            }
            else _sorter = _isInAscendingOrder ? new MethodsAsc() : new MethodsDesc();

            ChooseSortingMethod();

            _tempArray = _inputData.Split(new[] {_inputSeparator}, StringSplitOptions.None);
            if (_isIgnoreDuplicate) _tempArray = _tempArray.Distinct().ToArray();
            switch (_dataType)
            {
                case DataType.StringEnglish or DataType.StringUkrainian:
                    _permutation = _methodStr(ref _tempArray, out _time);
                    _outputData = string.Join(_outputSeparator, _tempArray);
                    break;
                case DataType.Length:
                    var lengthArray = _tempArray.Select(word => word.Length).ToArray();
                    _permutation = _methodInt(ref lengthArray, out _time);
                    var res = new string[lengthArray.Length];

                    for (var i = 0; i < res.Length; i++)
                    {
                        res[i] = Array.Find(_tempArray, word => word.Length == lengthArray[i]);
                        var numIndex = Array.IndexOf(_tempArray, res[i]);
                        _tempArray = _tempArray.Where((_, idx) => idx != numIndex).ToArray();
                    }

                    _outputData = string.Join(_outputSeparator, res);
                    break;
                default:
                {
                    var tempArrayInt = MyConvert.ToIntArray(_tempArray, _dataType);
                    _permutation = _methodInt(ref tempArrayInt, out _time);
                    _outputData = MyConvert.ToString(tempArrayInt, _dataType, _outputSeparator);
                    break;
                }
            }


            OutputText.Text = _outputData;
            PermutationNumberText.Content = _permutation.ToString();
            LenghtNumberText.Content = _tempArray.Length;
            TimeNumberText.Content = $"{_time} ticks";
        }

        private void ChooseSortingMethod()
        {
            switch (_sortingMethod)
            {
                case SortingMethods.Cocktail:
                    _methodInt = _sorter.CocktailSort;
                    _methodStr = _sorter.CocktailSort;
                    break;
                case SortingMethods.Insertion:
                    _methodInt = _sorter.InsertionSort;
                    _methodStr = _sorter.InsertionSort;
                    break;
                case SortingMethods.Merge:
                    _methodInt = _sorter.MergeSort;
                    _methodStr = _sorter.MergeSort;
                    break;
                case SortingMethods.Selection:
                    _methodInt = _sorter.SelectionSort;
                    _methodStr = _sorter.SelectionSort;
                    break;
                default:
                    _methodInt = _sorter.BubbleSort;
                    _methodStr = _sorter.BubbleSort;
                    break;
            }
        }

        private void BtnChangeLocalization(object sender, RoutedEventArgs e)
        {
            new MenuWindow(Thread.CurrentThread.CurrentUICulture.TwoLetterISOLanguageName == "uk" ? "en" : "uk",
                InputText.Text).Show();
            Close();
        }

        private void BtnOpenFile(object sender, RoutedEventArgs e)
        {
            InputText.Text = FileData.OpenFile();
        }

        private void BtnSaveFile(object sender, RoutedEventArgs e)
        {
            var name = ((Button) sender).Name;
            var textBox = (name == "LeftSaveButt") ? InputText : OutputText;
            FileData.SaveFile(textBox.Text);

            ShowStatus(SaveFileText, Brushes.Red);
        }

        private void BtnClearText(object sender, RoutedEventArgs e)
        {
            var name = ((Button) sender).Name;
            var textBox = (name == "LeftClearButt") ? InputText : OutputText;
            textBox.Text = string.Empty;
        }

        private void BtnCopyText(object sender, RoutedEventArgs e)
        {
            var name = ((Button) sender).Name;
            var textBox = (name == "LeftCopyButt") ? InputText : OutputText;
            Clipboard.SetText(textBox.Text);

            ShowStatus(CopyToClipboardText, Brushes.Green);
        }

        private async void ShowStatus(TextBlock textBlock, Brush color)
        {
            textBlock.Visibility = Visibility.Visible;
            textBlock.Background = color;
            await Task.Delay(3000);
            textBlock.Visibility = Visibility.Collapsed;
        }

        private void BtnFullscreen(object sender, RoutedEventArgs e)
        {
            var button = (Button) sender;
            var activeColumn = button.Name == "LeftFullScreenButt" ? LeftCol : RightCol;

            if (!_isFullscreen)
            {
                foreach (var column in Base.ColumnDefinitions)
                {
                    if (column.Name != activeColumn.Name)
                    {
                        column.Width = new GridLength(0, GridUnitType.Star);
                    }
                }

                button.Content = FindResource("FullscreenOut");
                _isFullscreen = true;
            }
            else
            {
                foreach (var column in Base.ColumnDefinitions)
                {
                    var columnsName = column.Name;
                    if (columnsName != activeColumn.Name)
                    {
                        column.Width = columnsName == CenterCol.Name
                            ? new GridLength(1.5, GridUnitType.Star)
                            : new GridLength(2, GridUnitType.Star);
                    }
                }

                button.Content = FindResource("FullscreenIn");
                _isFullscreen = false;
            }
        }

        private void TypeComboBox_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var comboBoxItem = TypeComboBox.SelectedItem;
            if (comboBoxItem == null) return;

            if (comboBoxItem.Equals(UaComboBox)) _dataType = DataType.StringUkrainian;
            else if (comboBoxItem.Equals(BinComboBox)) _dataType = DataType.NumberBinary;
            else if (comboBoxItem.Equals(DecComboBox)) _dataType = DataType.NumberDecimal;
            else if (comboBoxItem.Equals(HexComboBox)) _dataType = DataType.NumberHexadecimal;
            else if (comboBoxItem.Equals(LenComboBox)) _dataType = DataType.Length;
            else _dataType = DataType.StringEnglish;
        }

        private void MethodComboBox_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var methodComboBox = MethodComboBox.SelectedItem;
            if (methodComboBox == null) return;

            if (methodComboBox.Equals(CocktailComboBox)) _sortingMethod = SortingMethods.Cocktail;
            else if (methodComboBox.Equals(InsertionComboBox)) _sortingMethod = SortingMethods.Insertion;
            else if (methodComboBox.Equals(MergeComboBox)) _sortingMethod = SortingMethods.Merge;
            else if (methodComboBox.Equals(SelectionComboBox)) _sortingMethod = SortingMethods.Merge;
            else _sortingMethod = SortingMethods.Bubble;
        }

        private void BtnSample(object sender, RoutedEventArgs e)
        {
            var path = _dataType is DataType.StringEnglish or DataType.StringUkrainian ? PathEnumUa : PathEnumNum;
            InputText.Text = FileData.OpenSample(path);
        }
    }
}