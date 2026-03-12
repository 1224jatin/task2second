import 'package:flutter/cupertino.dart';
import 'package:task2/task_Model/taskSecond_Model.dart';
import 'package:flutter/material.dart';

class TasksecondVm extends ChangeNotifier{
  List<Task> tasks=[];
  void addTask(String  taskName , String taskDate , String taskDescription , String taskPriority ){
    tasks.add(Task(taskName: taskName,
        taskDate: taskDate,
        taskDescription: taskDescription,
        taskPerority: taskPriority
    ));
    notifyListeners();
  }
  void removeTask(int index ){
    tasks.removeAt(index);
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