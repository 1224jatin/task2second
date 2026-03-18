import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/task_Screen/taskList_screen.dart';

import '../task_viewModel/taskSecond_Vm.dart';

class Task2MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Task2Mainscreen();

}
class _Task2Mainscreen extends State<Task2MainScreen>{
  late final vm = Provider.of<TasksecondVm>(context);
  final _formkey = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priorityCOntroler = TextEditingController();
  List<String> priorities =["High", "Medium", "Low"];
  String selectedPriority = "Low";
  DateTime selectedDate = DateTime.now();


  Future<void>pickDate()async {
    final DateTime? pickedDate =
    await showDatePicker(context: context, firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    if(pickedDate != null){

      setState(() {
        selectedDate = pickedDate;
        dateController.text="${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Task Second", style: TextStyle(fontSize: 15 ),),
      leading: Icon(Icons.list_alt , size: 15),backgroundColor: Colors.red,
    ),
      body: Form(key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child:
              Card(
                color: Colors.lightBlueAccent,
                child: TextFormField(
                  controller: taskNameController,
                  decoration: InputDecoration(
                      label: const Text("Task ")
                  ),
                  validator: (value){
                    if (value == null){
                      return "enter Task";
                    }else{
                      return null ;
                    }
                  },
                ),
              ),
            ),
            Container(
              child:
              Card(
                color: Colors.lightBlueAccent,
                child: TextFormField(
                  controller: dateController,
                  onTap:pickDate,
                  decoration: InputDecoration(
                      label: const Text("Date ")
                  ),
                  validator: (value){
                    if (value == null){
                      return "enter date";
                    }else{
                      return null ;
                    }
                  },
                ),
              ),
            ),
            Container(
              child:
              Card(
                color: Colors.lightBlueAccent,
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      label: const Text("Description "),

                  ),maxLines: 5,
                  validator: (value){
                    if (value == null){
                      return "enter Task";
                    }else{
                      return null ;
                    }
                  },
                ),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedPriority,
              decoration: InputDecoration(
                label: const Text("Select Priority"),
              ),
              items: priorities.map((String priority){
                return DropdownMenuItem(child: Text(priority),
                value: priority);
              }).toList(),
              onChanged: (String? newValue){
                setState(() {
                  selectedPriority=newValue!;
                });

              },
            ),
            ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()){
                Provider.of<TasksecondVm>(context,listen: false)
                    .addTask(
                    {
                      "taskName": taskNameController,
                      "taskDate": selectedDate,
                      "taskDescription": descriptionController,
                      "priority": selectedPriority
                    }
                );

                Navigator.push(context, MaterialPageRoute(builder: (context)=> TasklistScreen()));
              }

            }, child: const Text("submit"))
          ],
        ),
      ),

    );
  }

}