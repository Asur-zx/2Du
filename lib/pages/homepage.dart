import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/todo.dart';
import 'package:flutter_application_1/utils/dialogbox.dart';
import 'package:hive/hive.dart';
import 'package:flutter_application_1/utils/menu.dart';
import 'package:flutter_application_1/utils/fonts.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _myBox = Hive.box("tableBox");
  TodoDataBase db = TodoDataBase();

  @override
  void initState(){
    if (_myBox.get("tasklist")==null){
      db.createInitData();
    }else{
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
    double drawerFontSize = fs.selectedSize/1.5;
    double appbarFontSize = fs.selectedSize/1;
    return Consumer<fontsSettings>(
      builder: (context, fontsSettings, child){
        return Scaffold(
          backgroundColor: AppColors.black,
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
            backgroundColor: AppColors.black,
          ),
          drawer: Drawer(
            backgroundColor: AppColors.gray,
            child: Column(
              children: [
                DrawerHeader(
                    child: Icon(
                      Icons.abc,
                      size: 48,
                      color: AppColors.white,
                    )
                ),
                Menu(drawerFontSize: drawerFontSize,),
                ListTile(
                  leading: Icon(Icons.delete, color: AppColors.red,),
                  title: Text(
                    "D E L E T E",
                    style: TextStyle(color: AppColors.red, fontSize: drawerFontSize, fontFamily: fs.selectedFont),
                  ),
                  onTap: drawerDelete,
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
              color: AppColors.white,
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
      },
    );
  }
}
