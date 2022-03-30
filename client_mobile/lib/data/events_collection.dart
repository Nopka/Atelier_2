import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsCollection extends ChangeNotifier {
  Future<List<Event>> getEvents() async {
    final _prefs = await SharedPreferences.getInstance();
    List<String> _data = _prefs.getStringList('user') ?? [];
    var idUser = _data[0];
    String urlEventUser =
        "http://docketu.iutnc.univ-lorraine.fr:62364/events/creators/" + idUser;
    Dio dio = Dio();

    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('token') ?? '';
    String auth = 'Bearer $data';

    List<Event> event = [];
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    String urlInvitationsUser =
        "http://docketu.iutnc.univ-lorraine.fr:62364/users/" +
            idUser +
            "/invitations";
    var responseEventUser = await dio.get(urlEventUser,
        options: Options(headers: <String, dynamic>{'Authorization': auth}));
    var responseInvitationsUser = await dio.get(urlInvitationsUser,
        options: Options(headers: <String, dynamic>{'Authorization': auth}));
    int i = 0;
    if (responseInvitationsUser.statusCode == 200) {
      //print(responseInvitationsUser.data['invitations']);
      for (var e in responseInvitationsUser.data['invitations']) {
        //print(e["idEvent"]);
        String urlInfoEvent =
            "http://docketu.iutnc.univ-lorraine.fr:62364/events/" +
                e["idEvent"];
        var responseInfoEvent = await dio.get(urlInfoEvent,
            options:
                Options(headers: <String, dynamic>{'Authorization': auth}));
        //print(responseInfoEvent.data);
        if (responseInfoEvent.statusCode == 200) {
          Event ajoutEvent = Event(
              id: responseInfoEvent.data["event"]['id'],
              titre: responseInfoEvent.data["event"]['titre'],
              description: responseInfoEvent.data["event"]['description'],
              lieu: responseInfoEvent.data["event"]['lieu'],
              idCreateur: responseInfoEvent.data["event"]['idCreateur'],
              date: responseInfoEvent.data["event"]['dateEvent'],
              createdAt: responseInfoEvent.data["event"]['created_at']);
          event.insert(i, ajoutEvent);
          i++;
        } else {
          print(
              "probleme lors de l'obtention des details de l'event via son id");
        }
      }
    } else {
      throw Exception(
          "Something gone wrong, ${responseInvitationsUser.statusCode}");
    }

    if (responseEventUser.statusCode == 200) {
      for (var e in responseEventUser.data['event']) {
        Event newEvent = Event(
            id: e['id'],
            titre: e['titre'],
            description: e['description'],
            lieu: e['lieu'],
            idCreateur: e['idCreateur'],
            date: e['dateEvent'],
            createdAt: e['created_at']);
        event.insert(i, newEvent);
        i++;
      }
    } else {
      throw Exception("Something gone wrong, ${responseEventUser.statusCode}");
    }
    return event;
  }
}
