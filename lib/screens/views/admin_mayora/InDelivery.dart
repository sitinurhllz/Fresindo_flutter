// import 'package:flutter/material.dart';
// import 'package:fresindot_track_app/screens/views/testing_screen/infotrack.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class InDeliveryAdmin extends StatefulWidget {
//   const InDeliveryAdmin({super.key});

//   @override
//   State<InDeliveryAdmin> createState() => _InDeliveryAdminState();
// }

// class _InDeliveryAdminState extends State<InDeliveryAdmin> {
//   List<dynamic> InDelivery = [];

//   Future<void> postData(String id, String status, BuildContext context) async {
//     var url = Uri.parse(
//         'http:/192.168.148.24/api-fresindo/api_approve.php'); // Replace with your API endpoint

//     var headers = {
//       'Content-Type': 'application/x-www-form-urlencoded'
//     }; // Set your request headers
//     var body = {
//       'id': id,
//       'status': status,
//     }; // Replace with your data

//     var response = await http.post(url, headers: headers, body: (body));

//     if (response.statusCode == 200) {
//       final snackBar = const SnackBar(
//         content: Text('Menambahkan Data Berhasil !!'),
//         duration: Duration(seconds: 3), // Optional: Set the duration
//       );
//       // Request successful
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else {
//       // Request failed
//       print('Failed to post data. Error: ${response.reasonPhrase}');
//     }
//   }

//   Future<void> fetchData() async {
//     var Url = Uri.parse('http://192.168.153.24/api-fresindo/show_gabungan.php');
//     try {
//       var response = await http.get(Url);
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         print(data);
//         setState(() {
//           InDelivery = data;
//         });

//         final snackBar = const SnackBar(
//           content: Text('Fetch Data Berhasil !!'),
//           duration: Duration(seconds: 3), // Optional: Set the duration
//         );
//         // Request successful
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       } else {
//         print('Gagal memuat data.');
//         final snackBar = const SnackBar(
//           content: Text('Fetch Data Gagal !!'),
//           duration: Duration(seconds: 3), // Optional: Set the duration
//         );
//         // Request successful
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     } catch (e) {
//       final snackBar = SnackBar(
//         content: Text('Fetch Data Gagal Error : $e'),
//         duration: const Duration(seconds: 3), // Optional: Set the duration
//       );
//       // Request successful
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       print('Terjadi kesalahan dalam memuat data: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('In Delivery'),
//       ),
//       body: Container(
//         child: ListView.builder(
//           itemCount: InDelivery.length,
//           itemBuilder: (BuildContext context, int index) {
//             print(InDelivery[index]);
//             return Card(
//               margin: const EdgeInsets.all(10.0),
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: const Icon(Icons.person),
//                     title: Text(InDelivery[index]['nama_supir']),
//                     subtitle: Text(InDelivery[index]['asal_perusahaan']),
//                   ),
//                   Column(
//                     children: [
//                       QrImageView(
//                         data: '${InDelivery[index]['id'] ?? '-'}',
//                         version: QrVersions.auto,
//                         size: 100.0,
//                       ),
//                       Text(
//                         'Nomor Do : ${InDelivery[index]['nomor_do'] ?? '-'}',
//                         style: const TextStyle(
//                           fontSize: 10.0,
//
//                         ),
//                       ),
//                       Text(
//                         'Nama Barang : ${InDelivery[index]['nama_barang'] ?? '-'}',
//                         style: const TextStyle(
//                           fontSize: 10.0,
//
//                         ),
//                       ),
//                       Text(
//                         'Jumlah : ${InDelivery[index]['jumlah'] ?? '-'}',
//                         style: const TextStyle(
//                           fontSize: 10.0,
//
//                         ),
//                       ),
//                       const Text(
//                         'Status Pengiriman : Barang Sedang Dikemas',
//                         style: TextStyle(
//                           fontSize: 10.0,
//
//                         ),
//                       ),
//                     ],
//                   ),
//                   ButtonBar(children: [
//                     ElevatedButton(
//                         child: const Text('Tracking'),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => InfoTrackBarang(
//                                 id: int.parse(
//                                     item['id']), // Use item['id'] here
//                               ),
//                             ),
//                           );
//                           ElevatedButton(
//                             child: const Text('validasi'),
//                             onPressed: () {
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => DetailDelivery(
//                               //             id: int.parse(InDelivery[index]['id']))));
//                               // postData(InDelivery[index]['id'], "Sampai", context);
//                               postData("2", "Sampai", context);
//                             },
//                           );
//                         })
//                   ]),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/coba.dart';
import 'package:fresindot_track_app/screens/views/testing_screen/infotrack.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InDeliveryAdmin extends StatefulWidget {
  const InDeliveryAdmin({Key? key});

  @override
  State<InDeliveryAdmin> createState() => _InDeliveryAdminState();
}

class _InDeliveryAdminState extends State<InDeliveryAdmin> {
  List<dynamic> InDelivery = [];

  Future<void> postData(String id, String status, BuildContext context) async {
    var url = Uri.parse(
        'http://192.168.1.244/api-fresindo/status_pengiriman_create.php'); // Replace with your API endpoint

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }; // Set your request headers
    var body = {
      'id_koordinat_pengiriman': id,
      'status': status,
    };

    print(body); // Replace with your data

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

  // Future<void> StatusUpdate(
  //     String id_koordinat_pengiriman, String status) async {
  //   var url = Uri.parse(
  //       'http://192.168.1.244/api-fresindo/status_pengiriman_create.php');

  //   var headers = {
  //     'Content-Type': 'application/x-www-form-urlencoded'
  //   }; // Set your request headers
  //   var body = {
  //     'id': id_koordinat_pengiriman,
  //     'status': status,
  //   }; // Replace with your data

  //   var response = await http.post(url, headers: headers, body: (body));

  //   if (response.statusCode == 200) {
  //     final snackBar = const SnackBar(
  //       content: Text('Update Data Status Berhasil !!'),
  //       duration: Duration(seconds: 3), // Optional: Set the duration
  //     );
  //     // Request successful
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   } else {
  //     // Request failed
  //     print('Failed to post data. Error: ${response.reasonPhrase}');
  //   }
  // }

  Future<void> fetchData() async {
    var Url = Uri.parse('http://192.168.1.244/api-fresindo/show_gabungan.php');
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            "IN DELIVERY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        automaticallyImplyLeading:
            false, // True, untuk mengaktifkan tombol back otomatis
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: ListView.builder(
        itemCount: InDelivery.length,
        itemBuilder: (BuildContext context, int index) {
          print(InDelivery[index]);
          var item = InDelivery[index];
          return Card(
            color: Colors.white,
            shadowColor: Colors.blueAccent,
            margin: const EdgeInsets.all(10.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    item['nama_supir'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    item['asal_perusahaan'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Column(
                  children: [
                    QrImageView(
                      data: '${item['id'] ?? '-'}',
                      version: QrVersions.auto,
                      size: 100.0,
                    ),
                    Text(
                      'Alamat Pengirim : ${item['alamat_pengirim'] ?? '-'}',
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Nama Barang : ${item['nama_barang'] ?? '-'}',
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Jumlah : ${item['jumlah'] ?? '-'}',
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      'Status Pengiriman : ',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      child: const Text(
                        'Tracking',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      onPressed: () {
                        print(item['id']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoTrackBarang(
                              id: int.parse(item['id'] ?? '-'),
                            ),
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Validasi',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      onPressed: () {
                        print(item['id']);
                        postData(item['id'] ?? '', 'Selesai', context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const Coba(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
