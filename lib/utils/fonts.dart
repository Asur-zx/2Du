import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class fontsSettings with ChangeNotifier{
  final _myBox = Hive.box("tableBox");
  String selectedFont = Hive.box("tableBox").get("font_family"); // Default :Roboto`
  double selectedSize = Hive.box("tableBox").get("font_size");//24
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

  void updateFsize(newfont){
    _myBox.put("font_size", newfont);
  }
  void updateFfamily(newfamily){
    _myBox.put("font_family", newfamily);
  }
}