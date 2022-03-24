import 'package:client_mobile/components/events/event_details.dart';
import 'package:client_mobile/data/events_collection.dart';
import 'package:client_mobile/screens/create_event.dart';
import 'package:client_mobile/screens/all_events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const Reunionou());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => EventsCollection()),
    ],
    child: const Reunionou(),
  ));
}

class Reunionou extends StatelessWidget {
  const Reunionou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
        theme: ThemeData(fontFamily: 'Oswald'),
        //home: const MyHomePage(title: 'Reunionou Home page'),
        initialRoute: AllEvents.route,
        routes: {
          AllEvents.route: (context) => AllEvents(
                title: 'Reunionou',
              ),
          CreateEvent.route: (context) =>
              const CreateEvent(title: 'Créer Events'),
          EventDetails.route: (context) =>
              const EventDetails(title: 'Event Details'),
        });
  }
}
