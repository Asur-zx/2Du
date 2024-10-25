import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:hive/hive.dart';


class themeProvider with ChangeNotifier{

  final _myBox = Hive.box("tableBox");

  ThemeData _themeData =(Hive.box("tableBox").get("theme_setting")=="darkMode")?darkMode:lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    updateTheme(themeData);
    notifyListeners();
  }

  void updateTheme(newtheme){
    String storetheme = (newtheme == darkMode)?"darkMode" : "lightMode";
    _myBox.put("theme_setting", storetheme);
  }

  ThemeData getTheme(){
    String newtheme = _myBox.get("theme_setting");
    switch(newtheme){
      case "darkMode":
        return darkMode;
      default:
        return lightMode;
    }
  }

  void toggleTheme(){
    if (_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
    updateTheme(themeData);
    notifyListeners();
  }
}