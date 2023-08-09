// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class InfoTrackBarang extends StatefulWidget {
//   final int id;
//   const InfoTrackBarang({Key? key, required this.id}) : super(key: key);
//   @override
//   State<InfoTrackBarang> createState() => _InfoTrackBarangState();
// }

// class _InfoTrackBarangState extends State<InfoTrackBarang> {
//   List<dynamic> infoDetail = [];
//   Future<void> fetchData() async {
//     var Url = Uri.parse('http://192.168.148.24/api-fresindo/show_gabungan_by_id.php?id=${widget.id}');
//     try {
//       var response = await http.get(Url);
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         print(data);
//         setState(() {
//           infoDetail = data;
//         });

//         final snackBar = const SnackBar(
//           content: Text('Fetch Data Berhasil !!'),
//           duration: Duration(seconds: 3),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       } else {
//         print('Gagal memuat data.');
//         final snackBar = const SnackBar(
//           content: Text('Fetch Data Gagal !!'),
//           duration: Duration(seconds: 3),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     } catch (e) {
//       final snackBar = SnackBar(
//         content: Text('Fetch Data Gagal Error : $e'),
//         duration: const Duration(seconds: 3),
//       );
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
//       body: Center(
//       child: ElevatedButton(
//         child: const Text('info'),
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return SizedBox(
//                 height: 200,
//                 child: Container(
//                   padding: const EdgeInsets.all(5.0),
//                   // decoration: const BoxDecoration(
//                   //   shape: BoxShape.circle,
//                   //   color: Colors.blue,
//                   // ),
//                   child: ListView.builder(
//                     itemCount: infoDetail.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Column(
//                         children: [
//                           ListTile(
//                             leading: Lottie.asset(
//                               'assets/lottie/profile2.json',
//                               height: 50,
//                               width: 50,
//                             ),
//                             title: Text(infoDetail[index]['nama_supir'] ?? ''),
//                             subtitle: Text(infoDetail[index]['plat'] ?? ''),
//                           ),
//                           const SizedBox(height: 20),
//                           Text(
//                             'Nama Barang : ${infoDetail[index]['nama_barang'] ?? '-'}',
//                             style: const TextStyle(
//                               fontSize: 10.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Text(
//                             'Jumlah : ${infoDetail[index]['jumlah'] ?? '-'}',
//                             style: const TextStyle(
//                               fontSize: 10.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Text(
//                             'Asal perusahaan : ${infoDetail[index]['asal_perusahaan'] ?? '-'}',
//                             style: const TextStyle(
//                               fontSize: 10.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           const Text(
//                             'Status Pengiriman :',
//                             style: TextStyle(
//                               fontSize: 10.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           // ElevatedButton(
//                           //   child: const Text('selesai'),
//                           //   onPressed: () {},
//                           // )
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfoTrackBarang extends StatefulWidget {
  final int id;
  const InfoTrackBarang({Key? key, required this.id}) : super(key: key);

  @override
  State<InfoTrackBarang> createState() => _InfoTrackBarangState();
}

class _InfoTrackBarangState extends State<InfoTrackBarang> {
  Map<String, dynamic> infoDetail = {}; // Update the data type to Map
  Future<void> fetchData() async {
    var Url = Uri.parse(
        'http://192.168.148.24/api-fresindo/show_gabungan_by_id.php?id=${widget.id}');
    try {
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        setState(() {
          infoDetail = data; // Assign the Map directly to infoDetail
        });

        final snackBar = const SnackBar(
          content: Text('Fetch Data Berhasil !!'),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Gagal memuat data.');
        final snackBar = const SnackBar(
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

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('info'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        print("Data Fetch : ${infoDetail['id']}");

                        return Column(
                          children: [
                            ListTile(
                              leading: Lottie.asset(
                                'assets/lottie/profile2.json',
                                height: 50,
                                width: 50,
                              ),
                              title: Text(infoDetail['nama_supir'] ?? ''),
                              subtitle: Text(infoDetail['plat'] ?? ''),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Nama Barang : ${infoDetail['nama_barang'] ?? '-'}',
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Jumlah : ${infoDetail['jumlah'] ?? '-'}',
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Asal perusahaan : ${infoDetail['asal_perusahaan'] ?? '-'}',
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Status Pengiriman : ${infoDetail['status_pengiriman'] ?? '-'}",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            // ElevatedButton(
                            //   child: const Text('selesai'),
                            //   onPressed: () {},
                            // )
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
