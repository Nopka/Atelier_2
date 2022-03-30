import 'package:client_mobile/screens/participants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../data/events_collection.dart';
import 'package:provider/provider.dart';
import '../map.dart';
import 'package:dio/dio.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key, required this.title}) : super(key: key);

  final String title;

  static String get route => '/event_details';

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class LatLong {
  double lat;
  double long;

  LatLong({required this.lat, required this.long});
}

Future<LatLong> getEventLocation(String address) async {
  var dio = Dio();
  Response responseAPI = await dio.get(
      "https://api.geoapify.com/v1/geocode/search?text=" +
          address +
          "&apiKey=feb8d3c41d7747c7a7cd3b367fb9c161");
  if (responseAPI.statusCode == 200) {
    return LatLong(
        lat: responseAPI.data['features'][0]['properties']['lat'],
        long: responseAPI.data['features'][0]['properties']['lon']);
  } else {
    throw Exception('Failed to fetch your location');
  }
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Détails de l'événement",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: Consumer<EventsCollection>(
        builder: (context, eventCollection, child) {
          return FutureBuilder(
            future: eventCollection.getEvents(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: ListView(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(
                          left: 3.0, right: 3.0, top: 0.0, bottom: 12.0),
                      padding: const EdgeInsets.all(2.0),
                      child: ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                            lg: 12,
                            child: Container(
                              height: 60,
                              alignment: const Alignment(0, 0),
                              //color: Colors.purple,
                              child: Text(
                                snapshot.data[args].titre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            xs: 6,
                            md: 3,
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data[args].date,
                                  style: const TextStyle(
                                      fontSize: 19, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          ResponsiveGridCol(
                            xs: 6,
                            md: 3,
                            child: Container(
                              height: 50,
                              alignment: const Alignment(0, 0),
                              //color: Colors.green,
                              child: Text(
                                snapshot.data[args].lieu,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            lg: 12,
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              margin: const EdgeInsets.all(6.0),
                              height: 40,
                              child: const Text(
                                "Description:",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            lg: 12,
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              height: 40,
                              child: Text(
                                snapshot.data[args].description,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            lg: 12,
                            child: Container(
                                height: 300,
                                alignment: const Alignment(0, 0),
                                color: Colors.grey,
                                child: FutureBuilder<LatLong>(
                                  future: getEventLocation(
                                      snapshot.data[args].lieu),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Mapp(
                                          lat: snapshot.data!.lat,
                                          long: snapshot.data!.long);
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                )),
                          ),
                          ResponsiveGridCol(
                            xs: 3,
                            md: 2,
                            child: Container(
                              height: 100,
                              alignment: const Alignment(0, 0),
                              // color: Colors.green,
                              child: SimpleElevatedButton(
                                child: const Text("Je viens"),
                                color: Colors.green,
                                onPressed: () {},
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            xs: 3,
                            md: 2,
                            child: Container(
                              height: 100,
                              alignment: const Alignment(0, 0),
                              //color: Colors.red,
                              child: SimpleElevatedButton(
                                child: const Text("Desole"),
                                color: Colors.red,
                                onPressed: () {},
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            xs: 3,
                            md: 2,
                            child: Container(
                              height: 100,
                              alignment: const Alignment(0, 0),
                              // color: Colors.green,
                              child: SimpleElevatedButton(
                                child: const Text("Chat"),
                                color: Colors.green,
                                onPressed: () {},
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            xs: 3,
                            md: 2,
                            child: Container(
                              height: 100,
                              alignment: const Alignment(0, 0),
                              // color: Colors.green,
                              child: SimpleElevatedButton(
                                child: const Text("Lien"),
                                color: Colors.green,
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Lien'),
                                    content:
                                        const Text('https://lien-de-cet-event'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            lg: 12,
                            child: Container(
                              height: 40,
                              alignment: const Alignment(0, 0),
                              // color: Colors.green,
                              child: SimpleElevatedButton(
                                child: const Text("Voir les participants"),
                                color: Colors.green,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Participants.route);
                                },
                              ),
                            ),
                          ),
                        ],
                      ))
                ]));
              } else {
                return Container(
                  padding: const EdgeInsets.all(50),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        },
      ),
      backgroundColor: Colors.lightGreen[300],
    );
  }
}

class SimpleElevatedButton extends StatelessWidget {
  const SimpleElevatedButton(
      {this.child,
      this.color,
      this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      Key? key})
      : super(key: key);
  final Color? color;
  final Widget? child;
  final Function? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
    );
  }
}
