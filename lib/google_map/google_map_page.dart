import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GoogleScreenPage extends StatefulWidget {
  GoogleScreenPage({Key? key}) : super(key: key);

  @override
  _GoogleScreenPageState createState() => _GoogleScreenPageState();
}

class _GoogleScreenPageState extends State<GoogleScreenPage> {
  String locationMessage = " Current location";
  String? lat;
  String? long;

  Future<Position> _GetLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location Service are Disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error("Location Permission denied, we cannot request");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google page"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Text("Map"),
            SizedBox(height: 10),
            Text(long.toString()),
            SizedBox(height: 10),
            Text(lat.toString()),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                _GetLocation().then(
                  (value) {
                    lat = '${value.latitude}';
                    long = '${value.longitude}';
                    setState(() {
                      locationMessage = 'Latitude : $lat, Longitude : $long';
                    });
                  },
                );
                log(lat.toString());
                log(long.toString());
              },
              child: Text("Get Current Location"),
            )
          ],
        ),
      ),
    );
  }
}
