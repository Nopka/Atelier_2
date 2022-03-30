//import 'package:client_mobile/models/event.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../map.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key, required this.title}) : super(key: key);
  //final Event? event;
  //final Function callbackResetEvent;

  static String get route => '/event_details';
  final String title;

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
        //Padding(padding: EdgeInsets.zero,),
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
                    child: const Text(
                      "Event title",
                      style: TextStyle(
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
                    children: const [
                      Text(
                        "Le 30/03/2022",
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                      Text(
                        " A 20h",
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Container(
                    height: 50,
                    alignment: const Alignment(0, 0),
                    //color: Colors.green,
                    child: const Text(
                      "Cafe Place Stanislas",
                      style: TextStyle(fontSize: 20, color: Colors.black),
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
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    height: 40,
                    child: const Text(
                      "here is a description for the event",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    //padding: const EdgeInsets.all(2.0),
                    height: 300,
                    alignment: const Alignment(0, 0),
                    color: Colors.grey,
                    child: const Mapp(
                      lat: 48.741173,
                      long: 1.954309,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 4,
                  md: 2,
                  child: Container(
                    height: 100,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: SimpleElevatedButton(
                      child: const Text("Je viens"),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 4,
                  md: 2,
                  child: Container(
                    height: 100,
                    alignment: const Alignment(0, 0),
                    //color: Colors.red,
                    child: SimpleElevatedButton(
                      child: const Text("Je viens pas"),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 4,
                  md: 2,
                  child: Container(
                    height: 100,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: SimpleElevatedButton(
                      child: const Text("Chat"),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ))
      ])),
      backgroundColor: Colors.lightGreen[300],
    );
  }
}

class SimpleElevatedButton extends StatelessWidget {
  const SimpleElevatedButton(
      {this.child,
      this.color,
      this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      Key? key})
      : super(key: key);
  final Color? color;
  final Widget? child;
  final Function? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
    );
  }
}
