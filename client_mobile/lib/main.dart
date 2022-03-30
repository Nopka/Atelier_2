import 'package:client_mobile/components/events/event_details.dart';
import 'package:client_mobile/components/log_in.dart';
import 'package:client_mobile/data/events_collection.dart';
import 'package:client_mobile/screens/create_event.dart';
import 'package:client_mobile/screens/event.dart';
import 'package:client_mobile/screens/home.dart';
import 'package:client_mobile/screens/participants.dart';
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
        theme: ThemeData(fontFamily: 'Oswald'),
        initialRoute: LoginPage.route,
        routes: {
          Home.route: (context) => const Home(
              // title: 'Reunionou',
              ),
          Event.route: (context) => const Event(),
          CreateEvent.route: (context) =>
              const CreateEvent(title: 'Créer Events'),
          EventDetails.route: (context) =>
              const EventDetails(title: 'Event Details'),
          LoginPage.route: (context) => const LoginPage(),
          Participants.route: (context) =>
              const Participants(title: 'Participants'),
        });
  }
}
