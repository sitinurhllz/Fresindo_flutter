import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/HomeAdmin.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/InDelivery.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/history.dart';
import 'package:fresindot_track_app/screens/views/driver/ProfilDriver.dart';
import 'package:fresindot_track_app/screens/views/driver/current_user.dart';
import 'package:fresindot_track_app/screens/views/driver/profile.dart';
import 'package:fresindot_track_app/screens/views/karyawan/BarcodeScan.dart';
import 'package:fresindot_track_app/screens/views/user/DetailSendGoods.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/Buttom_Nav_Provider.dart';
import 'Home.dart';

class MainActivityScreen extends StatefulWidget {
  const MainActivityScreen({Key? key}) : super(key: key);

  @override
  State<MainActivityScreen> createState() => _MainActivityScreenState();
}

class _MainActivityScreenState extends State<MainActivityScreen> {
  int currentIndex = 0;
  String userRole = "";

  @override
  void initState() {
    super.initState();
    getUserRole();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, nav, child) {
      List<BottomNavigationBarItem> items = _getBottomNavItems(userRole);
      List<Widget> pages = _getPages(userRole);

      return Scaffold(
        body: pages[nav.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 15.0,
          iconSize: 20,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.red,
          items: items,
          currentIndex: nav.currentIndex,
          onTap: (value) {
            setState(() {
              nav.changeIndex = value;
            });
          },
        ),
      );
    });
  }

  Future<void> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id') ??
        ""; // Provide a default value if userId is not found

    print("User id : $userId");
    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.1.244/api-fresindo/show_user_by_id.php?id=$userId'),
        headers: {"Content-Type": "application/json"},
      );

      final responseData = json.decode(response.body);

      print("Response Data : ${responseData}");
      if (responseData != null) {
        setState(() {
          userRole = responseData['jabatan'];
        });
      }
    } catch (e) {
      print('Error getting user role: $e');
    }
  }

  List<BottomNavigationBarItem> _getBottomNavItems(String userRole) {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
      BottomNavigationBarItem(icon: Icon(Icons.person_sharp), label: "Profile"),
    ];
  }

  List<Widget> _getPages(String userRole) {
    print("User Role : $userRole");
    if (userRole == "admin") {
      return [
        HomeAdmin(),
        History(),
        ProfilDriver(),
      ];
    } else if (userRole == "driver") {
      return [
        LocationUpdater(),
        History(),
        ProfilDriver(),
      ];
       } else if (userRole == "pengirim") {
      return [
        HomeScreen(),
        History(),
        ProfilDriver(),
      ];
    } else {
      return [
        History(),
        BarcodeScannerScreen(),
        InDeliveryAdmin(),
      ];
    }
  }
}
