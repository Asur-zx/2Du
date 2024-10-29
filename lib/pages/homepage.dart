import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/todo.dart';
import 'package:flutter_application_1/utils/dialogbox.dart';
import 'package:hive/hive.dart';
import 'package:flutter_application_1/utils/menu.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/utils/themeprovider.dart';

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
  // fontsSettings fs = fontsSettings();

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
    bool taskChanged = true;
    final snackbar = SnackBar(content: Text("item deleted !"), action: SnackBarAction(label: "Undo", onPressed: (){
      taskChanged = false;
    }),);

    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    await Future.delayed(Duration(seconds: 3));

    return taskChanged;
  }

   Future<void> deleteCard(index, task) async{
    setState(() {
      db.task_list.removeAt(index);
    });
    bool taskChanged = await showSnackbar(context);

    if (taskChanged) {
      db.updateData();
    }
    else{
      setState(() {
        db.task_list.insert(index, [task]);
      });
    }
    return;
  }

  void drawerDelete(){
    setState(() {
      db.task_list.clear();
    });
    db.updateData();
  }


  @override
  Widget build(BuildContext context) {
    bool isDark = (Provider.of<themeProvider>(context).themeData==darkMode)?true:false;
    double drawerFontSize = 16;
    double appbarFontSize = 24;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            title: Text(
              "2Du",
              style: TextStyle(
                color: AppColors.textColor2,
                fontSize: appbarFontSize,
              ),
            ),
            iconTheme: IconThemeData(color: AppColors.mainColor),
            elevation: 0,
          ),
          drawer: Drawer(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Column(
              children:[
                DrawerHeader(
                    child: Center(child: Text("Hello there,\n Hope this simple todo app came to your rescue\n :D ", textAlign: TextAlign.center,)),
                ),
        
                Menu(drawerFontSize: drawerFontSize,),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.secondary,
                    leading: Icon(Icons.color_lens, color: AppColors.textColor,),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Light", style: TextStyle(color: AppColors.textColor, fontSize: drawerFontSize),),
                        GestureDetector(
                          onTap: drawerDelete,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Switch(
                                value: isDark,
                                activeTrackColor: Theme.of(context).colorScheme.onSecondary,
                                activeColor: AppColors.primaryColor,
                                inactiveThumbColor: AppColors.textColor,
                                inactiveTrackColor: AppColors.secondaryColor,
                                onChanged: (value){
                                  setState(() {
                                    isDark = value;
                                    Provider.of<themeProvider>(context, listen: false).toggleTheme();
                                  });
                                },
                             ),
                          ),
                        ),
                        Text("Dark", style: TextStyle(color: AppColors.textColor, fontSize: drawerFontSize),),
                    ],
                    ),
                    onTap: drawerDelete,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.primary,
                    leading: Icon(Icons.delete, color: Colors.red,),
                    title: Text(
                      "D E L E T E",
                      style: TextStyle(color: Colors.red, fontSize: drawerFontSize, fontFamily: 'Roboto'),
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
            backgroundColor: AppColors.mainColor,
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
