import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster(
      {Key? key, required this.events, required this.callbackSetTask})
      : super(key: key);

  final List<Event> events;
  final Function callbackSetTask;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(events[index].titre),
                    textColor: Colors.green,
                    onTap: () {
                      callbackSetTask(events[index]);
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
