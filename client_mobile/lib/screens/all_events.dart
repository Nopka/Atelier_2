import 'package:client_mobile/components/users/user_profile.dart';
import 'package:client_mobile/models/event.dart';
import 'package:client_mobile/screens/create_event.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({Key? key, required this.title}) : super(key: key);
  final String title;
  static String get route => '/allEvents';

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
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
      Navigator.pushNamed(context, CreateEvent.route);
    }

    // Future<Event> listEvent = EventsCollection.getData();
    // debugPrint(listEvent.toString());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 43, 82, 21),
            indicatorWeight: 5,
            labelColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.star, color: Colors.black), text: 'Events'),
              Tab(icon: Icon(Icons.face, color: Colors.black), text: 'Profil')
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              width: 100,
              child: ResponsiveGridRow(children: [
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.all(10),
                      height: 160,
                      alignment: const Alignment(0, 0),
                      child: Stack(
                        children: [
                          Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 19,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                        ],
                      )

                      /* const Text(
                      "Event title",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black),
                    ), */
                      ),
                ),
              ]),
            ),
            UserProfile(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addEvent,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.lightGreen[300],
      ),
    );
  }
}
