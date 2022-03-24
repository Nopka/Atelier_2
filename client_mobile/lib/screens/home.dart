import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
import '../components/events/event_details.dart';


class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);


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
    return Scaffold(
      body: ListView.builder(
        itemCount: listText.length,
        itemBuilder: (context, index) {
          return 
            TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () { 
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EventDetails(),
                          ),
                        );
                    },
                    child: const Text('go to event detail'),
                  );
          
                        
          //Text(listText[index].titre);
        },
      ),
    );
  }
}
