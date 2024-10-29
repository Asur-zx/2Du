import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:hive/hive.dart';


class Colorscheme extends StatelessWidget with ChangeNotifier{

  final _myBox = Hive.box("tableBox");

  final maincolor = AppColors.mainColor.toString();

  String get _maincolor => maincolor;

  set _maincolor(String newcolor) {
    _maincolor = newcolor;
    String finalcolor = "0xff$_maincolor";
    _myBox.put("color_scheme", finalcolor);
    notifyListeners();
  }

  final controller_var=TextEditingController();

  void setColor(){
    _maincolor = controller_var.text;
  }

  Colorscheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "2do4u",
          style: TextStyle(
            color: AppColors.textColor2,
            fontSize: 24,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.mainColor),
        elevation: 0,
      ),
      body: Column(
        children: [
        Flexible(
          child: ListView.builder(
            itemCount: 1,
              itemBuilder: (context, index){
                return ListTile(
                  title: Row(children: [
                    Text("primary color : "),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        style: TextStyle(color: AppColors.textColor),
                        controller: controller_var,
                        decoration: InputDecoration(
                          hintText: "000000",
                          hintStyle: TextStyle(color: AppColors.textColor2),
                        ),
                      ),
                    ),
                  ],
                  ),
                );
              }
          ),
        ),
          MaterialButton(
            onPressed: setColor,
            child: Text("Save"),
          )
      ],
      )
    );
  }
}
