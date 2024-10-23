import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/button.dart';

class dialogBox extends StatelessWidget {
  final controller_var;
  VoidCallback savePress;
  VoidCallback cancelPress;
  dialogBox(
      {super.key,
      required this.controller_var,
      required this.savePress,
      required this.cancelPress});
  Color? buttoncolor1=AppColors.red;
  Color? buttoncolor2 = AppColors.white;
  Color? dialogtextcolor = AppColors.white;
  Color? dialogbackgroundcolor = AppColors.gray;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: dialogbackgroundcolor,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: TextStyle(color: dialogtextcolor),
              controller: controller_var,
              decoration: InputDecoration(
                  hintText: "Type new task",
                hintStyle: TextStyle(color: AppColors.palewhite)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                newButton(buttontitle: "Add", onpressed: savePress, buttoncolor: buttoncolor1, textcolor: buttoncolor2,),
                newButton(buttontitle: "Cancel", onpressed: cancelPress, buttoncolor: buttoncolor2, textcolor: buttoncolor1,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
