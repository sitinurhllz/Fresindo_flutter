import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Coba extends StatefulWidget {
  final int id;
  const Coba({Key? key, required this.id}) : super(key: key);

  @override
  State<Coba> createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Uri apiUrl =
        Uri.parse('http://192.168.1.244/api-fresindo/show_gabungan_by_id.phpid=${widget.id}');
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          userData = data;
        });

        final snackBar = SnackBar(
          content: Text('Fetch Data Berhasil !!'),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Gagal memuat data.');
        final snackBar = SnackBar(
          content: Text('Fetch Data Gagal !!'),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Fetch Data Gagal Error : $e'),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Terjadi kesalahan dalam memuat data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (BuildContext context, int index) {
          print("Panjang Data : ${userData.length}");
          // return Column(
          //   children: [
          //     Center(
          //       child: const Text(
          //         'Riwayat',
          //         style: TextStyle(
          //           fontFamily: 'Pacifico',
          //           fontSize: 40.0,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.blueAccent,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 20),
          //     Card(
          //       margin: EdgeInsets.all(20.0),
          //       elevation: 5.0,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       child: ListTile(
          //         leading: Lottie.asset(
          //           'assets/lottie/profile2.json',
          //           height: 50,
          //           width: 50,
          //         ),
          //         title: Text(userData['nama_lengkap']),
          //         subtitle: Text(userData['plat']),
          //       ),
          //     ),
          //     const SizedBox(height: 4),
          //     Container(
          //       padding: EdgeInsets.all(5.0),
          //       child: Card(
          //         margin: EdgeInsets.all(20.0),
          //         elevation: 5.0,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //         child: Column(
          //           children: [
          //             Center(
          //               child: Text(
          //                 'Detail Perjalanan',
          //                 style: TextStyle(
          //                   fontFamily: 'Pacifico',
          //                   fontSize: 20.0,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.blueAccent,
          //                 ),
          //               ),
          //             ),
          //             Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Column(
          //                   children: [
          //                     Icon(
          //                       Icons.arrow_circle_up_outlined,
          //                       size: 50,
          //                       color: Colors.blueAccent,
          //                     ),
          //                     Icon(
          //                       Icons.arrow_circle_down_outlined,
          //                       size: 50,
          //                       color: Colors.blueAccent,
          //                     )
          //                   ],
          //                 ),
          //                 Padding(padding: EdgeInsets.only(left: 15)),
          //                 Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Asal Pengiriman',
          //                       style: TextStyle(
          //                         fontFamily: 'Pacifico',
          //                         fontSize: 8.0,
          //                         // fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     const SizedBox(height: 2),
          //                     Text(
          //                       '${userData['alamat_pengirim'] ?? '-'}',
          //                       style: TextStyle(
          //                         fontFamily: 'Pacifico',
          //                         fontSize: 15.0,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     const SizedBox(height: 4),
          //                     Text(
          //                       'Tujuan Pengiriman',
          //                       style: TextStyle(
          //                         fontFamily: 'Pacifico',
          //                         fontSize: 8.0,
          //                         // fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     const SizedBox(height: 2),
          //                     Text(
          //                       '${userData[index]['alamat_tujuan'] ?? '-'}',
          //                       style: TextStyle(
          //                         fontFamily: 'Pacifico',
          //                         fontSize: 15.0,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 4),
          //     Card(
          //       margin: EdgeInsets.all(20.0),
          //       elevation: 5.0,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Center(
          //             child: Text(
          //               'Detail Perjalanan',
          //               style: TextStyle(
          //                 fontFamily: 'Pacifico',
          //                 fontSize: 20.0,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.blueAccent,
          //               ),
          //             ),
          //           ),
          //           Text(
          //             'nama barang : ${userData[index]['nama_barang'] ?? '-'}',
          //             style: TextStyle(
          //               fontFamily: 'Pacifico',
          //               fontSize: 15.0,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           Text(
          //             'nomor do : ${userData[index]['nomor_do'] ?? '-'}',
          //             style: TextStyle(
          //               fontFamily: 'Pacifico',
          //               fontSize: 15.0,
          //               fontWeight: FontWeight.bold,
          //               // color: Colors.blueAccent,
          //             ),
          //           ),
          //           Text(
          //             'nama perusahaan : ${userData[index]['asal_perusahaan'] ?? '-'}',
          //             style: TextStyle(
          //               fontFamily: 'Pacifico',
          //               fontSize: 15.0,
          //               fontWeight: FontWeight.bold,
          //               // color: Colors.blueAccent,
          //             ),
          //           ),
          //           Text(
          //             'jumlah : ${userData[index]['jumlah'] ?? '-'}',
          //             style: TextStyle(
          //               fontFamily: 'Pacifico',
          //               fontSize: 15.0,
          //               fontWeight: FontWeight.bold,
          //               // color: Colors.blueAccent,
          //             ),
          //           ),
          //           Text(
          //             '${userData[index]['status'] ?? '-'}',
          //             style: TextStyle(
          //               fontFamily: 'Pacifico',
          //               fontSize: 15.0,
          //               fontWeight: FontWeight.bold,
          //               // color: Colors.blueAccent,
          //             ),
          //           ),
          //           Text(
          //             '${userData[index]['create_at'] ?? '-'}',
          //             style: TextStyle(
          //               fontFamily: 'Pacifico',
          //               fontSize: 15.0,
          //               fontWeight: FontWeight.bold,
          //               // color: Colors.blueAccent,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
