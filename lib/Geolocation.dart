import 'package:assigment/Camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocod;

class Geolocation extends StatefulWidget {
  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {

  @override
  Widget build(BuildContext context) {
    return MainApp();
  }
}






class MainApp extends StatefulWidget {

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);

    List<geocod.Placemark> placemarks = await geocod.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    print(placemarks[1]);

    setState(() {
      locationMessage =
      "${position.latitude} , ${position.longitude} \n\n ${placemarks[1]}";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 46,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              "User Location",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(locationMessage),
            ElevatedButton(
                child: Text(" "),
                onPressed: () {
                  getCurrentLocation();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
                })
          ],
        ),
      ),
    );
  }
}

