import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class Participants extends StatelessWidget {
  const Participants({Key? key, required this.title}) : super(key: key);
  final String title;

  static String get route => '/participants';

  participant(String idEvent) async {
    try {
      String url =
          "http://docketu.iutnc.univ-lorraine.fr:62364/events/participations/" +
              idEvent;
      Dio dio = Dio(/*BaseOptions(responseType: ResponseType.plain)*/);
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';

      final prefs = await SharedPreferences.getInstance();
      String data = prefs.getString('token') ?? '';
      String auth = 'Bearer $data';

      //print('event ' + idEvent);
      //print('id ' + idUser);

      var response = await dio.get(url,
          options: Options(headers: <String, dynamic>{'Authorization': auth}));

      if (response.statusCode == 200) {
        //print(response.data["resultat"]);
        List<Object> participants = [];
        for (var part in response.data["resultat"]) {
          participants
              .add({"idUser": part['idUser'], "response": part['response']});
        }
        //print(participants.length);
        return participants;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: participant(args.toString()),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              //print(snapshot.data);
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: Text(snapshot.data[index]['idUser'] +
                            " a répondu : " +
                            snapshot.data[index]['response']));
                  });
            } else {
              return const CircularProgressIndicator();
            }
            // return Container();
          },
        ));
  }
}
