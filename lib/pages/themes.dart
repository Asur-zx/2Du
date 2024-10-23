import 'package:flutter/material.dart';

import '../utils/colors.dart';

List themeOptions=[
  "color_scheme",
  "back_ground",
];

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          "T H E M E S",
          style: TextStyle(
              color: AppColors.palewhite
          ),
        ),
        backgroundColor: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.palewhite),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          ListTile(
            title: Text("B A C K G R O U N D", style: TextStyle(color: AppColors.white),),
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text("C O L O R S", style: TextStyle(color: AppColors.white),),
          ),
        ],
      ),

    );
  }
}
