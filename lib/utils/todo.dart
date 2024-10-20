import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatelessWidget {
  TodoCard({super.key, required this.taskname, required this.deleteaction});
  String taskname = "";
  bool ischecked = false;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteaction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: AppColors.pinkred,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                taskname,
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
