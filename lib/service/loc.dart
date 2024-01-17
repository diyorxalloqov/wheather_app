import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => MapSampleState();
}

class MapSampleState extends State<LocationPage> {
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  // Make the getMyLocation method asynchronous
  Future<void> getMyLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Use await to wait for the asynchronous operation to complete
    _locationData = await location.getLocation();
  }

  @override
  void initState() {
    // Call the asynchronous method getMyLocation in initState
    getMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheMyLocation,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheMyLocation() async {
    // Now you can safely access _locationData
    print(_locationData.latitude);
    print(_locationData.longitude);
  }
}
