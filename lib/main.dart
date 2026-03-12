import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/task_Screen/task2_mainScreen.dart';
import 'package:task2/task_Screen/taskList_screen.dart' ;
import 'package:task2/task_viewModel/taskSecond_Vm.dart';

void main() {

  runApp(
      ChangeNotifierProvider(

        create: (context)=> TasksecondVm(),
        child: const MyApp(),

      )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  Task2MainScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Task MVVM second"),
      ),
      body: Center(

      ),

    );
  }
}
