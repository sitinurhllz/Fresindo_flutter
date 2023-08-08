// import 'package:flutter/material.dart';
// import 'package:fresindot_track_app/screens/views/admin_mayora/DetailDelivery.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class InDeliveryKaryawan extends StatefulWidget {
//   const InDeliveryKaryawan({super.key});

//   @override
//   State<InDeliveryKaryawan> createState() => _InDeliveryKaryawanState();
// }

// class _InDeliveryKaryawanState extends State<InDeliveryKaryawan> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('In Dellivery'),
//       ),
//       body: Container(
//         child: ListView(
//           children: [
//             Card(
//               margin: EdgeInsets.all(10.0),
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Supir Agani'),
//                     subtitle: Text('PT. Lintang Emas Pasifik'),
//                   ),
//                   Column(
//                     children: [
//                       QrImageView(
//                         data: '1234567890',
//                         version: QrVersions.auto,
//                         size: 100.0,
//                       ),
//                       Text(
//                         'No. DO : NP835H6284YU638',
//                         style: TextStyle(
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Nama Barang : Le Mineral',
//                         style: TextStyle(
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Jumlah : 1400 pcs',
//                         style: TextStyle(
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Status Pengiriman : Barang Sedang Dikemas',
//                         style: TextStyle(
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   ButtonBar(
//                     children: [
//                       ElevatedButton(
//                         child: Text('Tracking'),
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //       builder: (context) => const ()));
//                         },
//                       ),
//                       ElevatedButton(
//                         child: Text('View Detail'),
//                         onPressed: () {
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => const DetailDelivery()));
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               margin: EdgeInsets.all(10.0),
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Supir Agani'),
//                     subtitle: Text('PT. Lintang Emas Pasifik'),
//                   ),
//                   QrImageView(
//                     data: '1234567890',
//                     version: QrVersions.auto,
//                     size: 100.0,
//                   ),
//                   Text(
//                     'No. DO : NP835H6284YU638',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Nama Barang : Le Mineral',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Jumlah : 1400 pcs',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Status Pengiriman : Barang Sedang Dikemas',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   ButtonBar(
//                     children: [
//                       ElevatedButton(
//                         child: Text('Tracking'),
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //       builder: (context) => const ()));
//                         },
//                       ),
//                       ElevatedButton(
//                         child: Text('View Detail'),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               margin: EdgeInsets.all(10.0),
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Supir Agani'),
//                     subtitle: Text('PT. Lintang Emas Pasifik'),
//                   ),
//                   QrImageView(
//                     data: '1234567890',
//                     version: QrVersions.auto,
//                     size: 100.0,
//                   ),
//                   Text(
//                     'No. DO : NP835H6284YU638',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Nama Barang : Le Mineral',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Jumlah : 1400 pcs',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Status Pengiriman : Barang Sedang Dikemas',
//                     style: TextStyle(
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   ButtonBar(
//                     children: [
//                       ElevatedButton(
//                         child: Text('Tracking'),
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //       builder: (context) => const ()));
//                         },
//                       ),
//                       ElevatedButton(
//                         child: Text('View Detail'),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const DetailDelivery(
//                                         id: 1,
//                                       )));
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InDeliveryKaryawan extends StatefulWidget {
  const InDeliveryKaryawan({super.key});

  @override
  State<InDeliveryKaryawan> createState() => _InDeliveryKaryawanState();
}

class _InDeliveryKaryawanState extends State<InDeliveryKaryawan> {
  List<dynamic> InDelivery = [];

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
    var Url = Uri.parse('http://192.168.194.24/api-fresindo/show_gabungan.php');
    try {
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        setState(() {
          InDelivery = data;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In Delivery'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: InDelivery.length,
          itemBuilder: (BuildContext context, int index) {
            print(InDelivery[index]);
            return Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(InDelivery[index]['nama_supir']),
                    subtitle: Text(InDelivery[index]['asal_perusahaan']),
                  ),
                  Column(
                    children: [
                      QrImageView(
                        data: '${InDelivery[index]['id'] ?? '-'}',
                        version: QrVersions.auto,
                        size: 100.0,
                      ),
                      Text(
                        'Nomor Do : ${InDelivery[index]['nomor_do'] ?? '-'}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nama Barang : ${InDelivery[index]['nama_barang'] ?? '-'}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Jumlah : ${InDelivery[index]['jumlah'] ?? '-'}',
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
                  Center(
                    child: ButtonBar(
                      children: [
                        ElevatedButton(
                          child: const Text('Lihat Tracking'),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const ()));
                          },
                        ),
                       
                      ],
                    ),
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
