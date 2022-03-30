//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapp extends StatelessWidget {
  const Mapp({Key? key /* , required this.lag , required this.long  */}) : super(key: key);
  /* final double lag;
  final double long; */
  //LatLng(40.71, -74.00)
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      FlutterMap(
          options: MapOptions(minZoom: 10.0, center: LatLng(40.71, -74.00)),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(markers: [
              Marker(
                  width: 45.0,
                  height: 45.0,
                  point: LatLng(40.71, -74.00),
                  builder: (context) => Container(
                        padding: const EdgeInsets.all(0),
                        child: IconButton(
                            icon: const Icon(Icons.accessibility),
                            onPressed: () {
                             // print('Marker tapped!');
                            }),
                      ))
            ])
          ])
    ]);
  }
}
