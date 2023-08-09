// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:geolocator/geolocator.dart';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocationUpdater extends StatefulWidget {
//   @override
//   _LocationUpdaterState createState() => _LocationUpdaterState();
// }

// class _LocationUpdaterState extends State<LocationUpdater> {
//   String _userId = ''; // Will store the user ID obtained from SharedPreferences
//   String _latitude = '';
//   String _longitude = '';
//   Timer? _locationTimer;

//   @override
//   void initState() {
//     super.initState();
//     _getUserIdFromSharedPreferences();
//     _startLocationUpdates();
//   }

//   @override
//   void dispose() {
//     _stopLocationUpdates();
//     super.dispose();
//   }

//   void _getUserIdFromSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _userId = prefs.getString('user_id') ?? '';
//     });
//   }

//   void _startLocationUpdates() {
//     // Start a timer that updates the location every 5 seconds
//     _locationTimer = Timer.periodic(
//         const Duration(seconds: 5),
//         () {
//           _getCurrentLocation();
//         }

//         as void Function(Timer timer));
//   }

//   void _stopLocationUpdates() {
//     // Cancel the timer when the widget is disposed
//     _locationTimer?.cancel();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       setState(() {
//         _latitude = position.latitude.toString();
//         _longitude = position.longitude.toString();
//       });

//       if (_userId.isNotEmpty) {
//         // Save to Realtime Database using the user ID as the key
//         DatabaseReference databaseReference =
//             FirebaseDatabase.instance.ref().child('locations').child('1');
//         databaseReference.child('latitude').set(_latitude);
//         databaseReference.child('longitude').set(_longitude);
//       }
//     } catch (e) {
//       print('Error getting location: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Updater'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('User ID: $_userId'),
//             Text('Latitude: $_latitude'),
//             Text('Longitude: $_longitude'),
//             ElevatedButton(
//               onPressed: _getCurrentLocation,
//               child: Text('Update Location'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationUpdater extends StatefulWidget {
  @override
  _LocationUpdaterState createState() => _LocationUpdaterState();
}

class _LocationUpdaterState extends State<LocationUpdater> {
  late String _userId; // Use 'late' modifier since you'll set it later
  String _latitude = '';
  String _longitude = '';
  Timer? _locationTimer;

  @override
  void initState() {
    super.initState();
    _getUserIdFromSharedPreferences();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _stopLocationUpdates();
    super.dispose();
  }

  Future<void> _getUserIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString('user_id') ?? '';
    });
  }

  void _startLocationUpdates() {
    _locationTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        _getCurrentLocation();
      },
    );
  }

  void _stopLocationUpdates() {
    _locationTimer?.cancel();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _latitude = position.latitude.toString();
        _longitude = position.longitude.toString();
      });

      if (_userId.isNotEmpty) {
        DatabaseReference databaseReference = FirebaseDatabase.instance
            .reference()
            .child('locations')
            .child(_userId); // Use the actual user ID as the key
        databaseReference.child('latitude').set(_latitude);
        databaseReference.child('longitude').set(_longitude);
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Updater'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID: $_userId'),
            Text('Latitude: $_latitude'),
            Text('Longitude: $_longitude'),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('Update Location'),
            ),
          ],
        ),
      ),
    );
  }
}
