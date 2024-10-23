import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class fontsSettings extends ChangeNotifier{
  String selectedFont = 'Roboto'; // Default font`
  double selectedSize = 24;
  double selectionSize = 6;
  // List of fonts to choose from

  double get fontsize => selectedSize;
  String get fontfamily => selectedFont;

  void setfontsize(double newsize){
    selectedSize = newsize;
    notifyListeners();
  }

  void setfontfamily(String newfamily){
    selectedFont = newfamily;
    notifyListeners();
  }
}