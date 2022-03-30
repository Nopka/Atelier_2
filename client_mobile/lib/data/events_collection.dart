import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsCollection extends ChangeNotifier {
  Future<List<Event>> getEvents() async {
    final _prefs = await SharedPreferences.getInstance();
    List<String> _data = _prefs.getStringList('user') ?? [];
    var idUser =  _data[0];
    print(idUser);
    String url = "http://docketu.iutnc.univ-lorraine.fr:62364/events/creators/"+idUser;
    Dio dio = Dio();

    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('token') ?? '';
    String auth = 'Bearer $data';

    List<Event> event = [];
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    /* Event newEvent = Event(id: 'titre', titre: 'titre',description: 'desc' , lieu: 'lieu', idCreateur: '@username', createdAt: '29/03/2022', date: '30/03/2022'); 
          event.insert(0, newEvent); */

    var response = await dio.get(url, options: Options(headers: <String, dynamic>{'Authorization': auth}));
    if (response.statusCode == 200) {
      //return event.fromJson(response.data);
      int i = 0;
      for (var e in response.data['event']) {
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
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
    //print(event);
    return event;
  }
}
