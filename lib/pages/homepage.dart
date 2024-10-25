import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/todo.dart';
import 'package:flutter_application_1/utils/dialogbox.dart';
import 'package:hive/hive.dart';
import 'package:flutter_application_1/utils/menu.dart';
import 'package:flutter_application_1/utils/fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/utils/themeprovider.dart';

import '../utils/themeprovider.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _myBox = Hive.box("tableBox");
  TodoDataBase db = TodoDataBase();
  themeProvider tp = themeProvider();

  @override
  void initState(){
    if (_myBox.get("tasklist")==null){
      db.createInitData();
    } else{
      db.loadData();
    }
    super.initState();
  }
  void savepress() {
    setState(() {
      db.task_list.add([_controller.text]);
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updateData();
  }

  void cancelpress() {
    Navigator.of(context).pop();
  }

  final _controller = TextEditingController();
  fontsSettings fs = fontsSettings();

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


  Future<bool> showSnackbar(BuildContext context) async{
    bool task_changed = true;
    final snackbar = SnackBar(content: Text("item deleted !"), action: SnackBarAction(label: "Undo", onPressed: (){
      task_changed = false;
    }),);

    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    await Future.delayed(Duration(seconds: 3));

    return task_changed;
  }

   Future<void> deleteCard(index, task) async{
    setState(() {
      db.task_list.removeAt(index);
    });
    bool task_changed = await showSnackbar(context);

    if (task_changed) {
      db.updateData();
    }
    else{
      setState(() {
        db.task_list.insert(index, [task]);
      });
    }
    return null;
  }

  void drawerDelete(){
    setState(() {
      db.task_list.clear();
    });
    db.updateData();
  }


  Widget build(BuildContext context) {
    bool isDark = (Provider.of<themeProvider>(context).themeData==darkMode)?true:false;
    double drawerFontSize = fs.fontsize/1.5;
    double appbarFontSize = fs.fontsize/1;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            title: Text(
              "2do4u",
              style: TextStyle(
                color: AppColors.palewhite,
                fontSize: appbarFontSize,
              ),
            ),
            iconTheme: IconThemeData(color: AppColors.red),
            elevation: 0,
          ),
          drawer: Drawer(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Column(
              children:[
                DrawerHeader(
                    child: Icon(
                      Icons.abc,
                      size: 48,
                      // color: AppColors.white,
                    )
                ),

                Menu(drawerFontSize: drawerFontSize,),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.secondary,
                    leading: Icon(Icons.color_lens, color: AppColors.white,),
                    title: Row(
                      children: [
                        Text("Light", style: TextStyle(color: AppColors.white),),
                        GestureDetector(
                          onTap: drawerDelete,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Switch(
                                value: isDark,
                                activeTrackColor: Theme.of(context).colorScheme.onSecondary,
                                activeColor: AppColors.black,
                                inactiveThumbColor: AppColors.white,
                                inactiveTrackColor: AppColors.gray,
                                onChanged: (value){
                                  setState(() {
                                    isDark = value;
                                    Provider.of<themeProvider>(context, listen: false).toggleTheme();
                                  });
                                },
                             ),
                          ),
                        ),
                        Text("Dark", style: TextStyle(color: AppColors.white),),
                    ],
                    ),
                    onTap: drawerDelete,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.primary,
                    leading: Icon(Icons.delete, color: AppColors.red,),
                    title: Text(
                      "D E L E T E",
                      style: TextStyle(color: AppColors.red, fontSize: drawerFontSize, fontFamily: fs.selectedFont),
                    ),
                    onTap: drawerDelete,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton:
          FloatingActionButton(
            onPressed: addcard,
            backgroundColor: AppColors.red,
            child: Icon(
              Icons.add,
              // color: AppColors.white,
            ),

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: ListView.builder(
            itemCount: db.task_list.length,
            itemBuilder: (context, index) {
              return TodoCard(
                taskname: db.task_list[index][0],
                deleteaction: () => deleteCard(index, db.task_list[index][0]),
              );
            },
          ),
        );
  }
}
