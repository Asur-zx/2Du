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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.gray,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller_var,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Type new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                newButton(buttontitle: "Add", onpressed: savePress),
                newButton(buttontitle: "Cancel", onpressed: cancelPress)
              ],
            )
          ],
        ),
      ),
    );
  }
}
