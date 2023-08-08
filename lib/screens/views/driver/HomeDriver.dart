import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DetailDelivery.dart';
import 'package:fresindot_track_app/screens/views/driver/fetch_location.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class WaitingStartTrack extends StatefulWidget {
  const WaitingStartTrack({super.key});

  @override
  State<WaitingStartTrack> createState() => _WaitingStartTrackState();
}

class _WaitingStartTrackState extends State<WaitingStartTrack> {
  List<dynamic> StartTrack = [];
  String _userId = '';

  Future<void> postData(String id, String status, BuildContext context) async {
    var url = Uri.parse(
        'http://192.168.1.244/api-fresindo/api_approve.php'); // Replace with your API endpoint

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }; // Set your request headers
    var body = {
      'id': id,
      'status': status,
    }; // Replace with your data

    var response = await http.post(url, headers: headers, body: (body));

    if (response.statusCode == 200) {
      final snackBar = const SnackBar(
        content: Text('Menambahkan Data Berhasil !!'),
        duration: Duration(seconds: 3), // Optional: Set the duration
      );
      // Request successful
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Request failed
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  }

  Future<void> fetchData() async {
    var Url = Uri.parse('http://192.168.1.244/api-fresindo/show_gabungan.php');
    try {
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        setState(() {
          StartTrack = data;
        });

        final snackBar = const SnackBar(
          content: Text('Fetch Data Berhasil !!'),
          duration: Duration(seconds: 3), // Optional: Set the duration
        );
        // Request successful
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Gagal memuat data.');
        final snackBar = const SnackBar(
          content: Text('Fetch Data Gagal !!'),
          duration: Duration(seconds: 3), // Optional: Set the duration
        );
        // Request successful
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Fetch Data Gagal Error : $e'),
        duration: const Duration(seconds: 3), // Optional: Set the duration
      );
      // Request successful
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Terjadi kesalahan dalam memuat data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _getUserIdFromSharedPreferences();
  }

  void _getUserIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString('user_id') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Mayora Group",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  "PT. Tirta Fresindo Jaya",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            const Center(
              child: Text(
                "HALAMAN IN DELIVERY",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading:
            false, // True, untuk mengaktifkan tombol back otomatis
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: StartTrack.length,
          itemBuilder: (BuildContext context, int index) {
            print(StartTrack[index]);
            return Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(StartTrack[index]['nama_supir']),
                    subtitle: Text(StartTrack[index]['asal_perusahaan']),
                  ),
                  Column(
                    children: [
                      QrImageView(
                        data: '${StartTrack[index]['id'] ?? '-'}',
                        version: QrVersions.auto,
                        size: 100.0,
                      ),
                      Text(
                        'Nomor Do : ${StartTrack[index]['nomor_do'] ?? '-'}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nama Barang : ${StartTrack[index]['nama_barang'] ?? '-'}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Jumlah : ${StartTrack[index]['jumlah'] ?? '-'}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Status Pengiriman : Barang Sedang Dikemas',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        child: const Text('Mulai Tracking'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FetchLocation(
                                        id_kendaraan: StartTrack[index]
                                            ['id_kendaraan'],
                                        userId: _userId,
                                      )));
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const ()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
