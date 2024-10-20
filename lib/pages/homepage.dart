import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/todo.dart';
import 'package:flutter_application_1/utils/dialogbox.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void savepress() {
    setState(() {
      task_list.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void cancelpress() {
    Navigator.of(context).pop();
  }

  final _controller = TextEditingController();

  List task_list = [];

  void addcard() {
    showDialog(
        context: context,
        builder: (context) {
          return dialogBox(
            controller_var: _controller,
            savePress: savepress,
            cancelPress: cancelpress,
          );
        });
  }

  Function(BuildContext)? deleteCard(index) {
    setState(() {
      task_list.removeAt(index);
    });
    return null;
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
          FloatingActionButton(onPressed: addcard, child: Icon(Icons.add)),
      body: ListView.builder(
        itemCount: task_list.length,
        itemBuilder: (context, index) {
          return TodoCard(
            taskname: task_list[index][0],
            deleteaction: (context) => deleteCard(index),
          );
        },
      ),
    );
  }
}
