import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/history.dart';
import 'package:fresindot_track_app/screens/views/karyawan/InDelivery.dart';
import 'package:fresindot_track_app/screens/views/karyawan/ProfilKaryawan.dart';
import 'package:fresindot_track_app/screens/views/karyawan/BarcodeScan.dart';

import '../driver/profile.dart';

class NavbarKaryawan extends StatefulWidget {
  const NavbarKaryawan({super.key});

  @override
  State<NavbarKaryawan> createState() => _NavbarKaryawanState();
}

class _NavbarKaryawanState extends State<NavbarKaryawan> {
  int currentIndex = 0;

  List listPage = [
    BarcodeScannerScreen(),
    const InDeliveryKaryawan(),
    const History(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(icon: Icon(Icons.barcode_reader), title: Text("home")),
          BottomNavyBarItem(icon: Icon(Icons.fire_truck_outlined), title: Text("Delivery")),
          BottomNavyBarItem(icon: Icon(Icons.history_sharp), title: Text("history")),
          BottomNavyBarItem(icon: Icon(Icons.person_outline_rounded), title: Text("profile")),
        ],
      ),
    );
  }
}
