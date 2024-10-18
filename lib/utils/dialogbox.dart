import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/button.dart';

class dialogBox extends StatelessWidget {
  dialogBox({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.gray,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Type new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                newButton(buttontitle: "Add", onpressed: () {}),
                newButton(buttontitle: "Cancel", onpressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
