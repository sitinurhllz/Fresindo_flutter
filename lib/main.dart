import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fresindot_track_app/provider/Buttom_Nav_Provider.dart';
import 'package:fresindot_track_app/screens/Home.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/AddKendaraan.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataBarang.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataKendaraan.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataUser.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/EditBarang.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/InDelivery.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/coba.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/dashboard.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/AddBarang.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/history.dart';
import 'package:fresindot_track_app/screens/views/driver/NavbarDriver.dart';
import 'package:fresindot_track_app/screens/views/driver/ProfilDriver.dart';
import 'package:fresindot_track_app/screens/views/driver/current_user.dart';
import 'package:fresindot_track_app/screens/views/driver/fetch_location.dart';
import 'package:fresindot_track_app/screens/views/driver/maps_current.dart';
import 'package:fresindot_track_app/screens/views/driver/profile.dart';
import 'package:fresindot_track_app/screens/views/karyawan/BarcodeScan.dart';
import 'package:fresindot_track_app/screens/views/karyawan/InDelivery.dart';
import 'package:fresindot_track_app/screens/views/karyawan/NavbarKaryawan.dart';
import 'package:fresindot_track_app/screens/views/karyawan/ProfilKaryawan.dart';
import 'package:fresindot_track_app/screens/views/testing_screen/infotrack.dart';
import 'package:fresindot_track_app/screens/views/user/DetailSendGoods.dart';
import 'package:fresindot_track_app/screens/views/user/InDelivery.dart';
import 'package:fresindot_track_app/screens/views/user/navbar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/login.dart';
import 'screens/main_activity_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Geolocator.requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: MaterialApp(
        title: 'Fresindo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: 'deliveryAdmin',
        routes: {
          // "/": (context) => const Navbar(),

          // admin
          'login': (context) => const Login(),
          // 'addUser': (context) => const AddUserForm(),
          'showUser': (context) => const DataUser(),
          'history': (context) => History(),
          // 'main_screen': (context) => const Navbar(),
          'dashboard': (context) => const Dashboard(),
          'deliveryAdmin': (context) => const InDeliveryAdmin(),
          'addBarang': (context) => const AddBarang(),
          'AddKendaraan': (context) => const AddKendaraan(),
          'coba': (context) => const Coba(
                id: 1,
              ),
          'dataBarang': (context) => const DataBarang(),
          'dataKendaraan': (context) => const DataKendaraan(),
          'editBarang': (context) => const EditBarang(id: 1),
          'main_activity': (context) => MainActivityScreen(),

          // pengirim
          'InDelivery': (context) => const InDeliveryPengirim(),
          'DetailDelivery': (context) => const DetailSendGoods(),
          'NavbarUser': (context) => const NavbarUser(),

          // karyawan
          'navbar_Karyawan': (context) => const NavbarKaryawan(),
          'scanBarcode': (context) => BarcodeScannerScreen(),
          'delivery': (context) => const InDeliveryKaryawan(),
          'profilekaryawan': (context) => const ProfilKaryawan(),

          // driver
          'profilDriver': (context) => const ProfilDriver(),
          'navbarDriver': (context) => const NavbarDriver(),
          'bottom': (context) => const InfoTrackBarang(
                id: 1,
              ),
          'maps': (context) => const LocationScreen(),
          // 'maps_fetch': (context) => const TrackingMap(),
          'locations': (context) => FetchLocation(
                userId: '',
                id_kendaraan: '',
              ),
          'current': (context) => LocationUpdater(),

          'profile': (context) => const Profile(),

          'HomeScreen': (context) => HomeScreen(),
        },
      ),
    );
  }
}
