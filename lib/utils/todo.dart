import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class TodoCard extends StatelessWidget {
  TodoCard(
      {super.key,
      required this.taskname,
      required this.ischecked,
      required this.onChanged});
  String taskname = "";
  bool ischecked = false;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(
              value: ischecked,
              onChanged: onChanged,
              activeColor: AppColors.gray,
            ),
            Text(
              taskname,
              style: TextStyle(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
