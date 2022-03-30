import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
import '../map.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:responsive_grid/responsive_grid.dart';
//import 'package:client_mobile/data/events_collection.dart';
//import 'package:flutter_responsive/flutter_responsive.dart';

class EventForm extends StatefulWidget {
  const EventForm({
    Key? key,
    this.task,
    /*required this.tasksCollection*/
  }) : super(key: key);

  final Event? task;
  //final Event tasksCollection;

  @override
  State<EventForm> createState() => _EventFormState();
}

//Model de données pour un objet "LatLong"
class LatLong {
  double lat;
  double long;

  LatLong({required this.lat, required this.long});
}

// Fonction asynchrone pour obtenir les coordonnées en fonction de l'ip
Future<LatLong> getCurrentLocation() async {
  var dio = Dio();
  Response responseAPI = await dio.get("http://ip-api.com/json/");
  // print(responseAPI.toString());
  if (responseAPI.statusCode == 200) {
    return LatLong(lat: responseAPI.data['lat'], long: responseAPI.data['lon']);
  } else {
    throw Exception('Failed to fetch your location');
  }
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  final titreController = TextEditingController();
  final descController = TextEditingController();
  final lieuController = TextEditingController();

  //static final now = DateTime.now();
  //DateTime now = DateTime.now();

  static final now = DateTime.now();
  DateTime selectedDate = now;
  //DateTime pickedDate;
  final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');
  final last = now.add(const Duration(days: 365));

  getIDUser() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> data = prefs.getStringList('user') ?? [];
    return data[0];
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: const TextStyle(fontSize: 24),
                    controller: titreController,
                    decoration: const InputDecoration(
                      hintText: "Titre",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrez une valeur correcte';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: descController,
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrez une valeur correcte';
                      }
                      return null;
                    },
                  ),
                  CalendarDatePicker(
                    initialDate: now,
                    firstDate: now,
                    lastDate: last,
                    onDateChanged: (DateTime? value) {
                      setState(() {
                        selectedDate = value!;
                      });
                    },
                  ),
                  TextFormField(
                    controller: lieuController,
                    decoration: const InputDecoration(
                      hintText: "date (AAAA-MM-JJ)",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    //readOnly: true,
                    onTap: () async {
                      CalendarDatePicker(
                        initialDate: now,
                        firstDate: now,
                        lastDate: last,
                        onDateChanged: (DateTime? value) {
                          setState(() {
                            selectedDate = value!;
                          });
                        },
                      );
                    },
                  ),
                  /*    */
                  TextFormField(
                    controller: lieuController,
                    decoration: const InputDecoration(
                      hintText: "Heure",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrez une valeur correcte';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lieuController,
                    decoration: const InputDecoration(
                      hintText: "Lieu",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrez une valeur correcte';
                      }
                      return null;
                    },
                  ),
                  Container(
                      height: 300,
                      margin: const EdgeInsets.all(10),
                      alignment: const Alignment(0, 0),
                      color: Colors.grey,
                      child: FutureBuilder<LatLong>(
                        future: getCurrentLocation(),
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
                      ))
                ],
              ),
            ),
          ),
          if (!isKeyboard)
            FutureBuilder<dynamic>(
                future: getIDUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          String message = "";
                          //print(snapshot.data);
                          Event event = Event(
                              titre: titreController.text,
                              description: descController.text,
                              //date: selectedDate,
                              lieu: lieuController.text,
                              idCreateur: snapshot.data);
                          if (widget.task != null) {
                            // widget.tasksCollection
                            //     .update(widget.task!, myController.text, completed);
                            message = "L'évenement à étés modifier !";
                          } else {
                            // widget.tasksCollection.create(myController.text, completed);
                            message = "L'évenement à été créer !";
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
        ],
      ),
    );
  }
}
