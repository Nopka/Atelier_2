import 'package:client_mobile/models/event.dart';
import 'package:client_mobile/screens/create_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/events/event_details.dart';

class AllEvents extends StatelessWidget {
  AllEvents({Key? key, required this.title}) : super(key: key);
  final String title;
  static String get route => '/allEvents';

  final List<Event> listText = [
    Event(
        id: 1,
        titre: "test",
        description: "description",
        date: DateTime(2022, 9, 9, 17, 50),
        lieu: 'briey',
        idCreateur: "idCreateur",
        token: "token",
        createdAt: DateTime.now(),
        updateAt: DateTime.now())
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void addEvent() {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const CreateEvent(
      //       title: 'Créer Event',
      //       //tasksCollection: ,
      //     ),
      //   ),
      // );
      Navigator.pushNamed(context, CreateEvent.route);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: listText.length,
        itemBuilder: (context, index) {
          return TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const EventDetails(
              //       title: 'Event Details',
              //     ),
              //   ),
              // );
              Navigator.pushNamed(context, EventDetails.route);
            },
            child: const Text('go to event detail'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightGreen[300],
    );
  }
}
