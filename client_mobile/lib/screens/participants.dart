import 'package:flutter/material.dart';
/* import 'package:responsive_grid/responsive_grid.dart'; */

class Participants extends StatelessWidget {
  const Participants({Key? key, required this.title}) : super(key: key);
  final String title;

  static String get route => '/participants';

  @override
  Widget build(BuildContext context) {
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
      body: (ListView(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightGreen[300],
            ),
            child: Column(
              children: const [
                Text('Ils viennent'),
                ListTile(
                  title: Text('lisa'),
                  subtitle: Text('guest'),
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            child: Column(
              children: const [
                Text('Ils viennent pas'),
                ListTile(
                  title: Text('Richard'),
                  subtitle: Text('guest'),
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                )
              ],
            )),
      ])),
    );
  }
}
