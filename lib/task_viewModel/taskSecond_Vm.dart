import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:task2/task_Model/taskSecond_Model.dart';
import 'package:flutter/material.dart';

class TasksecondVm extends ChangeNotifier{
  final box = Hive.box('task');
  List get tasks=>box.values.toList() ;
  void addTask(Map task ){
    box.add(task);
    print("Task added ${box.values.toList()}");
    notifyListeners();
  }
  void removeTask(int index ){
    box.deleteAt(index);
notifyListeners();
  }

Color getpriorityColor(String taskPriority){
    switch(taskPriority){
      case "High" :
        return Colors.red;
      case "Medium" :
        return Colors.yellow;
      case "Low":
        return Colors.green;
        default:
          return Colors.blueGrey;
    }
}



}