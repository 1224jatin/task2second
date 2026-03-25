class Task{
  final String taskName ;
  final DateTime taskDate ;
  final String taskDescription ;
  final String taskPerority ;

  Task({
    required this.taskName,
    required this.taskDate,
    required this.taskDescription,
    required this.taskPerority
  });
  Map<String, dynamic> toMap(){
    return {
      "taskName" : taskName,
      "taskDate" : taskDate,
      "taskDespription": taskDescription,
      "taskPeriority" : taskPerority,
    };
  }

}