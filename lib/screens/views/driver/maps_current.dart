import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fresindot_track_app/firebase_options.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Location App',
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _locationMessage = "";
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_locationMessage),
            ElevatedButton(
              onPressed: () => _startLocationUpdates(),
              child: const Text('Start Sending Location Data'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getLocation() async {
    // Check if the app has permission to access the location
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

    // Check and request location permission
    PermissionStatus permissionStatus =
        await Permission.locationWhenInUse.status;
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await Permission.locationWhenInUse.request();
      if (permissionStatus != PermissionStatus.granted) {
        setState(() {
          _locationMessage = "Location permission denied.";
        });
        return;
      }
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Update the location message
    setState(() {
      _locationMessage =
          "Current location: ${position.latitude}, ${position.longitude}";
    });

    // Send data to the Firebase Realtime Database
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('locations').set({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': DateTime.now().toUtc().toString(),
    });
  }

  void _startLocationUpdates() {
    // Call the _getLocation() function initially
    _getLocation();

    // Start a timer to call _getLocation() every 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _getLocation());
  }
}
