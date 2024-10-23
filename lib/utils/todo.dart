import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatelessWidget {
  TodoCard({super.key, required this.taskname, required this.deleteaction});
  String taskname = "";
  bool ischecked = false;
  Function(bool?)? onChanged;
  void Function() deleteaction;
  @override
  Widget build(BuildContext context) {
    fontsSettings fs = fontsSettings();
    double todoFontSize = fs.selectedSize/1.2;
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
      child: Slidable(
        key: ValueKey(taskname),

        startActionPane: ActionPane(
          dismissible: DismissiblePane(onDismissed: deleteaction),
          motion: StretchMotion(),

          children: [
            SlidableAction(
              onPressed: null,
              icon: Icons.delete,
              backgroundColor: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                taskname,
                style: TextStyle(
                    color: AppColors.white,
                  fontSize: todoFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
