import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/history.dart';
import 'package:fresindot_track_app/screens/views/driver/HomeDriver.dart';
// import 'package:fresindot_track_app/screens/views/driver/ProfilDriver.dart';
import 'package:fresindot_track_app/screens/views/driver/profile.dart';

class NavbarDriver extends StatefulWidget {
  const NavbarDriver({super.key});

  @override
  State<NavbarDriver> createState() => _NavbarDriverState();
}

class _NavbarDriverState extends State<NavbarDriver> {
  int currentIndex = 0;
  List listPage = [const WaitingStartTrack(), const History(), const Profile()];

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
          BottomNavyBarItem(icon: const Icon(Icons.home), title: const Text("home")),
          BottomNavyBarItem(icon: const Icon(Icons.history_edu), title: const Text("history")),
          BottomNavyBarItem(icon: const Icon(Icons.person_outline_rounded), title: const Text("profile")),
        ],
      ),
    );
  }
}