import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:task2/sqlflite_DB/db_helper.dart';
import 'package:task2/task_Model/taskSecond_Model.dart';
import 'package:flutter/material.dart';

class TasksecondVm extends ChangeNotifier{


  void addTask(Task task){
    DbHelper().insertData(task);
    notifyListeners();
  }
  void removeTask(int index ){

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