import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

class FetchLocation extends StatefulWidget {
  final String userId;
  final String id_kendaraan;

  FetchLocation({required this.userId, required this.id_kendaraan});

  @override
  _FetchLocationState createState() => _FetchLocationState();
}

class _FetchLocationState extends State<FetchLocation> {
  GoogleMapController? _mapController;
  List<Marker> _markers = [];
  LatLngBounds? _bounds;

  @override
  void initState() {
    super.initState();
    _initFirebase();
    _startLocationUpdates();
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('locations').child("1");
    _listenToUserLocation(databaseReference);
  }

  void _listenToUserLocation(DatabaseReference reference) {
    reference.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        double latitude = double.parse(values['latitude'].toString());
        double longitude = double.parse(values['longitude'].toString());
        LatLng userLocation = LatLng(latitude, longitude);
        setState(() {
          _markers = [
            Marker(
              markerId: MarkerId('user_location'),
              position: userLocation,
              infoWindow: InfoWindow(title: 'User Location'),
            ),
          ];
          _updateBounds();
        });
      }
    });
  }

  void _updateBounds() {
    if (_markers.isNotEmpty) {
      double minLat = _markers[0].position.latitude;
      double maxLat = _markers[0].position.latitude;
      double minLng = _markers[0].position.longitude;
      double maxLng = _markers[0].position.longitude;

      for (var marker in _markers) {
        double lat = marker.position.latitude;
        double lng = marker.position.longitude;

        minLat = lat < minLat ? lat : minLat;
        maxLat = lat > maxLat ? lat : maxLat;
        minLng = lng < minLng ? lng : minLng;
        maxLng = lng > maxLng ? lng : maxLng;
      }

      _bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _startLocationUpdates() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // _saveLocationToServer(position.latitude, position.longitude);
    });
  }

  // void _saveLocationToServer(double latitude, double longitude) async {
  //   // Replace this URL with your server's API endpoint for saving location data
  //   final apiUrl =
  //       'http://192.168.194.24/api-fresindo/koordinat_pengiriman_create.php';

  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     body: {
  //       'id_kendaraan': widget.id_kendaraan,
  //       'latitude': latitude.toString(),
  //       'longitude': longitude.toString(),
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     print('Location data saved successfully');
  //   } else {
  //     print(
  //         'Failed to save location data. Status code: ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Location on Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(0, 0), zoom: 15),
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.from(_markers),
        onCameraMove: (CameraPosition position) {},
        onCameraIdle: () {
          if (_bounds != null && _mapController != null) {
            _mapController!
                .moveCamera(CameraUpdate.newLatLngBounds(_bounds!, 50));
          }
        },
      ),
    );
  }
}
