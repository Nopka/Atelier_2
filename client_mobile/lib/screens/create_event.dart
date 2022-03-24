import 'package:client_mobile/components/events/event_form.dart';
import 'package:client_mobile/data/events_collection.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({
    Key? key,
    required this.title,
    /*required this.tasksCollection*/
  }) : super(key: key);

  final String title;
  //final EventsCollection tasksCollection;

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: EventForm(
          //tasksCollection: widget.tasksCollection,
          ),
    );
  }
}
