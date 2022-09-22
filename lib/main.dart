import 'package:assigment/Camera.dart';
import 'package:assigment/Geolocation.dart';
import 'package:assigment/Voice.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocod;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  Geolocation(),
           //Voice(),
      // CameraPage(),
      ),
    );
  }
}
