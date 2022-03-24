import 'package:client_mobile/screens/create_event.dart';
import 'package:client_mobile/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      theme: ThemeData(fontFamily: 'Oswald', brightness: Brightness.dark),
      home: const MyHomePage(title: 'Reunionou Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
        builder: (context) => CreateEvent(
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
        title: Text(widget.title),
      ),
      resizeToAvoidBottomInset: false,
      body: Home(),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
