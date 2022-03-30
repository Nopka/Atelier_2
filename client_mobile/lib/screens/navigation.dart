import 'package:flutter/material.dart';
import 'package:client_mobile/screens/profile.dart';
import '../components/events/event_form.dart';
import 'all_events.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);
  static String get route => '/navigation';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Reunionou',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            bottom: const TabBar(
              indicatorColor: Color.fromARGB(255, 43, 82, 21),
              indicatorWeight: 5,
              labelColor: Colors.black,
              tabs: [
                Tab(
                    icon: Icon(Icons.star, color: Colors.black),
                    text: 'Events'),
                Tab(icon: Icon(Icons.add, color: Colors.black), text: 'Add'),
                Tab(
                    icon: Icon(Icons.face, color: Colors.black),
                    text: 'Profil'),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Container(
              color: Colors.lightGreen[300],
              child:
                  ListView(padding: const EdgeInsets.all(16), children: const [
                AllEvents(title: 'Event title'),
                AllEvents(title: 'Event title'),
                AllEvents(title: 'Event title'),
                AllEvents(title: 'Event title'),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const EventForm(),
              color: Colors.lightGreen[300],
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const Profile(),
              color: Colors.lightGreen[300],
            ),
          ]),
        ));
  }
}
