import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
//import 'package:responsive_grid/responsive_grid.dart';
//import 'package:client_mobile/data/events_collection.dart';
//import 'package:flutter_responsive/flutter_responsive.dart';

class EventForm extends StatefulWidget {
  const EventForm({
    Key? key,
    this.task,
    /*required this.tasksCollection*/
  }) : super(key: key);

  final Event? task;
  //final Event tasksCollection;

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  static final now = DateTime.now();
  DateTime selectedDate = now;
  final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');
  final last = now.add(const Duration(days: 32));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    hintText: "Titre",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez rentrez une valeur correcte';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez rentrez une valeur correcte';
                    }
                    return null;
                  },
                ),
                CalendarDatePicker(
                  initialDate: now,
                  firstDate: now,
                  lastDate: last,
                  onDateChanged: (DateTime? value) {
                    setState(() {
                      selectedDate = value!;
                    });
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    hintText: "Lieu",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez rentrez une valeur correcte';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              String message = "";
              if (widget.task != null) {
                // widget.tasksCollection
                //     .update(widget.task!, myController.text, completed);
                message = "L'évenement à était modifier !";
              } else {
                // widget.tasksCollection.create(myController.text, completed);
                message = "L'évenement à était créer !";
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
