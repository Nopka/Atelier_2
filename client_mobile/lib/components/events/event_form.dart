import 'package:client_mobile/models/task.dart';
import 'package:flutter/material.dart';
// import 'package:todolist/data/tasks_collection.dart';
// import 'package:todolist/models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, this.task, required this.tasksCollection})
      : super(key: key);

  final Event? task;
  final Event tasksCollection;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  bool completed = false;

  @override
  void initState() {
    super.initState();
    //completed = widget.task?.id ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: "Texte",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Checkbox(
                value: completed,
                onChanged: (bool? value) {
                  setState(() {
                    completed = value!;
                  });
                },
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     hintText: "Date de création",
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              String message = "";
              if (widget.task != null) {
                // widget.tasksCollection
                //     .update(widget.task!, myController.text, completed);
                message = "La tâche à était modifier !";
              } else {
                // widget.tasksCollection.create(myController.text, completed);
                // message = "La tâche à était créer !";
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const AllTasks(
              //       title: "All Tasks",
              //     ),
              //   ),
              // );
              Navigator.pop(context);
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
