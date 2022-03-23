import 'package:client_mobile/models/task.dart';
import 'package:flutter/material.dart';
//import 'package:todolist/models/task.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster(
      {Key? key, required this.tasks, required this.callbackSetTask})
      : super(key: key);

  final List<Event> tasks;
  final Function callbackSetTask;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(tasks[index].titre),
                    textColor: Colors.green,
                    onTap: () {
                      callbackSetTask(tasks[index]);
                    },
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 5.0,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
