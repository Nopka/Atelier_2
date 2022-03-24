import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
// import 'package:todolist/data/tasks_collection.dart';
// import 'package:todolist/models/task.dart';
// import 'package:todolist/screens/one_task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {Key? key, required this.task, required this.callbackResetTask})
      : super(key: key);
  final Event? task;
  final Function callbackResetTask;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
