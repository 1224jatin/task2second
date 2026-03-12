import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../task_viewModel/taskSecond_Vm.dart';

class TasklistScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TasklistScreen();
}
class _TasklistScreen extends State<TasklistScreen>{
  late final vm = Provider.of<TasksecondVm>(context) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(itemBuilder: (context,index) {
          return Container( height: 200,width: 300,
            child: Card(
              //background Card
               color: vm.getpriorityColor(vm.tasks[index].taskPerority) ,
                child:
              Column(
                // column for task date de.....!

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(
                  // row for title  , info
                  children: [
                    const Text("Task = ", style: TextStyle( fontSize: 20),),
                    Text(vm.tasks[index].taskName)
                  ],
                ),
                  Row(
                    children: [
                      const Text("Date = ", style: TextStyle( fontSize: 20)),
                      Text(vm.tasks[index].taskDate)
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Task = ", style: TextStyle( fontSize: 20)),
                      Text(vm.tasks[index].taskDescription)
                    ],
                  ),
                  ElevatedButton(onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("task is completed"),
                      duration: Duration(seconds: 2),));
                  }, child: const Text("Done"),),
                  ElevatedButton(onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("task is Deleted"),
                      duration: Duration(seconds: 2),));
                  }, child: const Text(" Delete"))

                ],
              )

              ),

          );

        }, itemCount: vm.tasks.length,),
      ),
    );
  }

}