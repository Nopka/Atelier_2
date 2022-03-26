import 'package:client_mobile/models/event.dart';
import 'package:client_mobile/screens/create_event.dart';
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
 /*    void addEvent() {
      Navigator.pushNamed(context, CreateEvent.route);
    } */

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Center(
             child : Text(
              'Event Title',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
           ),
            const Text(
              'Date: 30/03/2022',
              style: TextStyle(fontSize: 17),
            ),
             const Text(
              'Time: 20pm',
              style: TextStyle(fontSize: 17),
            ),
             const Text(
              'Lieu: Cafe Place Stanislas',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 12),
            const Text(
              '@Username',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: const Text('go to Event Details'),
                  onPressed: () {
                    Navigator.pushNamed(context, EventDetails.route);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
