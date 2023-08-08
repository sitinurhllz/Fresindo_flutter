import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/driver/history.dart';
import 'package:fresindot_track_app/screens/views/user/DetailSendGoods.dart';
import 'package:fresindot_track_app/screens/views/user/InDelivery.dart';
import '../driver/profile.dart';


class NavbarUser extends StatefulWidget {
  const NavbarUser({super.key});

  @override
  State<NavbarUser> createState() => _NavbarUserState();
}

class _NavbarUserState extends State<NavbarUser> {
  int currentIndex = 0;

  List listPage = [const DetailSendGoods(), const InDeliveryPengirim(), const HistoryDriver(), const Profile()];
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
          BottomNavyBarItem(icon: const Icon(Icons.send_rounded), title: const Text("home")),
          BottomNavyBarItem(icon: const Icon(Icons.fire_truck_outlined), title: const Text("Delivery")),
          BottomNavyBarItem(icon: const Icon(Icons.history), title: const Text("History")),
          BottomNavyBarItem(icon: const Icon(Icons.person), title: const Text("profile")),
        ],
      ),
    );
  }
}
