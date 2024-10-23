import 'package:hive/hive.dart';

class TodoDataBase{

  List task_list = [];

  final _myBox = Hive.box("tableBox");

  void createInitData(){
    task_list = [
      ["Make tutorial"],
      ["Exercise"],
    ];
  }

  void loadData(){
    task_list = _myBox.get("tasklist");
  }

  void updateData(){
    _myBox.put("tasklist", task_list);
  }
}