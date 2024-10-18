import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/todo.dart';
import 'package:flutter_application_1/utils/dialogbox.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List task_list = [
    ["task card 1", false],
    ["task card 2", false],
    ["task card 3", true]
  ];

  void checkboxchanged(bool? value, int index) {
    setState(() {
      task_list[index][1] = !task_list[index][1];
    });
  }

  void addcard() {
    showDialog(
        context: context,
        builder: (context) {
          return dialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          "Hello",
          style: TextStyle(color: AppColors.yellow),
        ),
        elevation: 0,
        backgroundColor: AppColors.black,
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: addcard),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return TodoCard(
              taskname: task_list[index][0],
              ischecked: task_list[index][1],
              onChanged: (value) => checkboxchanged(value, index));
        },
      ),
    );
  }
}
