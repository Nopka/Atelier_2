import 'dart:convert';

import 'package:client_mobile/screens/participants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../data/events_collection.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import '../map.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key, required this.title}) : super(key: key);

  final String title;

  static String get route => '/event_details';

  invitation(String resp) async {
    try {
      String url = "http://docketu.iutnc.univ-lorraine.fr:62370/invitations/";
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';

      var response = await dio.post(url, data: jsonEncode({'response': resp}));
      if (response.statusCode == 200) {
        return 'votre réponse a été envoyé avec succès';
      } else {
        return 'reponse non enregistrée';
      }
    } catch (e) {
      return 'error';
    }
  }

  @override
  State<EventDetails> createState() => _EventDetailsState();
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
                  child: ListView(
                    children: <Widget>[
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
                                  height: 150,
                                  alignment: const Alignment(0, 0),
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
                                  padding: const EdgeInsets.all(10.0),
                                  height: 300,
                                  alignment: const Alignment(0, 0),
                                  child: const Mapp(
                                    lat: 48.741173,
                                    long: 1.954309,
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
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget.invitation('oui');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Je viens'),
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
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget.invitation('non');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Desole'),
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
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Tchat'),
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
                                  child: ElevatedButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Lien'),
                                        content: const Text(
                                            'https://lien-de-cet-event'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Lien'),
                                  ),
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 12,
                                child: Container(
                                  height: 40,
                                  alignment: const Alignment(0, 0),
                                  // color: Colors.green,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Participants.route);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Voir les participants'),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                );
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
