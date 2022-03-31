import 'dart:convert';

import 'package:client_mobile/screens/participants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../data/events_collection.dart';
import 'package:provider/provider.dart';
import '../map.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key, required this.title}) : super(key: key);

  final String title;

  static String get route => '/event_details';

  invitation(String resp) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> _data = prefs.getStringList('user') ?? [];
      var idUser = _data[0];
      String url = "http://docketu.iutnc.univ-lorraine.fr:62364/users/" +
          idUser +
          "/invitations";
      Dio dio = Dio(/*BaseOptions(responseType: ResponseType.plain)*/);
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';

      String data = prefs.getString('token') ?? '';
      String auth = 'Bearer $data';

      //print('event ' + idEvent);
      //print('id ' + idUser);

      var response = await dio.get(url,
          options: Options(headers: <String, dynamic>{'Authorization': auth}));

      if (response.statusCode == 200) {
        for (var invitation in response.data['invitations']) {
          //print('p id ' + invitation['idUser']);
          if (invitation['idUser'] == idUser) {
            print("USER TROUVE");
            String urlUpdate =
                'http://docketu.iutnc.univ-lorraine.fr:62364/invitations/' +
                    invitation["id"];
            try {
              var responseUpdate = await dio.put(urlUpdate,
                  options: Options(
                      headers: <String, dynamic>{'Authorization': auth}),
                  data: jsonEncode({"response": resp}));
              //print(response_update.data);
              if (responseUpdate.statusCode == 200) {
                print(responseUpdate);
              } else {
                print("ddd");
              }
            } catch (e) {
              print(e);
            }
          }
        }
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

class LatLong {
  double lat;
  double long;

  LatLong({required this.lat, required this.long});
}

Future<LatLong> getEventLocation(String address) async {
  var dio = Dio();
  try {
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
  } catch (e) {
    print(e);
    return LatLong(lat: 0, long: 0);
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Vous avez répondu oui.")),
                                      );
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Vous avez répondu non.")),
                                      );
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
                                          context, Participants.route,
                                          arguments: snapshot.data[args].id);
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
