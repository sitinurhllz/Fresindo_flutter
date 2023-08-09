
import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/login.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/AddUserForm.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/history.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddBarang.dart';
import 'AddKendaraan.dart';
import 'DataBarang.dart';
import 'DataKendaraan.dart';
import 'DataUser.dart';
import 'InDelivery.dart';

void main() {
  runApp(const MaterialApp(
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> dashboardData = [];
  late String user_id;
  Map<String, dynamic>? userData;

  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.1.244/api-fresindo/show_user.php');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print("CEKK HASIL : $data");

        final user = data.firstWhere(
          (user) => user['id'].toString() == user_id,
          orElse: () => null,
        );

        setState(() {
          userData = user;
        });

        const snackBar = SnackBar(
          content: Text('Fetch Data Berhasil !!'),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Gagal memuat data.');
        const snackBar = SnackBar(
          content: Text('Fetch Data Gagal !!'),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Fetch Data Gagal Error : $e'),
        duration: const Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Terjadi kesalahan dalam memuat data: $e');
    }
  }

  Future<void> getDataShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("user_id");
    setState(() {
      user_id = data.toString();
    });
    print("Data : $data");
  }

  @override
  void initState() {
    super.initState();
    getDataShared();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: UserDrawerWidget(
          userData: userData,
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              Lottie.asset(
                'assets/lottie/hello.json',
                height: 400,
                width: 200,
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              const Text(
                'Welcome to Dashboard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 12.0)),
              const Text(
                'ADMIN MAYORA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserDrawerWidget extends StatelessWidget {
  final Map<String, dynamic>? userData;

  const UserDrawerWidget({
    this.userData,
  });

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      print("${userData?['nama_perusahaan']}");

      return Container(
        color: Colors.white,
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.blue,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                width: 300,
                child: Column(children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/images/profile.png'),
                  ),
                  Text(
                    userData?['nama_lengkap'].toString() ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    userData?['nama_perusahaan'].toString() ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text('Create User'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddUserForm(),
                      ),
                    );
                  },
                ),
                ListTile(
                      title: const Text('Add Data Barang'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddBarang()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Add Data Kendaraan'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddKendaraan()));
                      },
                    ),
                    ListTile(
                      title: const Text('Data User'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DataUser()));
                      },
                    ),
                    ListTile(
                      title: const Text('Data Barang'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DataBarang()));
                      },
                    ),
                    ListTile(
                      title: const Text('Data Kendaraan'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DataKendaraan()));
                      },
                    ),
                    ListTile(
                      title: const Text('Dalam Pengiriman'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InDeliveryAdmin()));
                      },
                    ),
                    ListTile(
                      title: const Text('Riwayat'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  History()));
                      },
                    ),
                    ListTile(
                      title: const Text('Keluar'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Login()));
                      },
                    ),
              ],
            ),
          ],
        ),
      );
    }
  }
}

// class AddUserForm extends StatelessWidget {
//   const AddUserForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add User Form'),
//       ),
//       body: const Center(
//         child: Text('Add User Form Screen'),
//       ),
//     );
//   }
// }

