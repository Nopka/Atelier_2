import 'package:client_mobile/screens/create_event.dart';
import 'package:client_mobile/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Reunionou());
}

class Reunionou extends StatelessWidget {
  const Reunionou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Reunionou',
      theme: ThemeData(fontFamily: 'Oswald'),
      //home: const MyHomePage(title: 'Reunionou'),
      home: Scaffold(
        appBar: AppBar(
        //title: Text(widg, style:const TextStyle(color: Colors.black),),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.lightGreen[300],
      body: Home(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        /*     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateEvent(
                  title: "Créer Event",
                  //tasksCollection: ,
                ),
              ),
            ); */
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      ),
      
      
    );
  }
}

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addEvent() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateEvent(
          title: "Créer Event",
          //tasksCollection: ,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style:const TextStyle(color: Colors.black),),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: Home(),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightGreen[300],

    );

  }
}
 */