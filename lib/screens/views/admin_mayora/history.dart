// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class History extends StatefulWidget {
//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   String uid = "";
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getSharedPref();
//     fetchDataById();
//   }

//   Future<void> getSharedPref() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final userId = prefs.getString('user_id') ?? "";
//     uid = userId;
//   }

//   Future<void> getKendaraan() async {

//   }

//   Future<Map<String, dynamic>> fetchDataById() async {
//     final apiUrl = Uri.parse(
//         'http://192.168.1.244/api-fresindo/show_gabungan.php'); // Replace with your API endpoint
//     try {
//       final response = await http.get(apiUrl);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print("Data response : $data");
//         return data;
//       } else {
//         throw Exception('Failed to fetch data');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       appBar: AppBar(
//         title: const Text('History'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Card(
//             //   elevation: 5.0,
//             //   margin: const EdgeInsets.all(20.0),
//             //   child: Column(
//             //     mainAxisAlignment: MainAxisAlignment.start,
//             //     children: [
//             //       const ListTile(
//             //         leading: Icon(Icons.person),
//             //         title: Text(
//             //           'Supir Agani',
//             //           style: TextStyle(
//             //             fontFamily: 'Poppins',
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //         subtitle: Text(
//             //           'PT. Lintang Emas Pasifik',
//             //           style: TextStyle(
//             //             fontFamily: 'Poppins',
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //       ),
//             //       const Text(
//             //         'Delivery Time: 14 June 2023 03.04 AM',
//             //         style: TextStyle(
//             //           fontFamily: 'Poppins',
//             //         ),
//             //       ),
//             //       const Text(
//             //         'Location : 56 street ....',
//             //         style: TextStyle(
//             //           fontFamily: 'Poppins',
//             //         ),
//             //       ),
//             //       TextButton(
//             //         onPressed: () async {
//             //           try {
//             //             // final data = await fetchDataById('your_id_here');
//             //             // Navigator.push(
//             //             //   context,
//             //             //   MaterialPageRoute(
//             //             //     builder: (context) => DetailScreen(data: data),
//             //             //   ),
//             //             // );
//             //           } catch (e) {
//             //             print('Error: $e');
//             //           }
//             //         },
//             //         style: TextButton.styleFrom(
//             //           padding: const EdgeInsets.symmetric(
//             //               vertical: 12, horizontal: 20),
//             //           backgroundColor: Colors.blue,
//             //           shape: const StadiumBorder(),
//             //         ),
//             //         child: const Text(
//             //           'View Details',
//             //           style: TextStyle(
//             //             fontFamily: 'Poppins',
//             //           ),
//             //         ),
//             //       ),
//             //       const SizedBox(height: 20),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DetailScreen extends StatelessWidget {
//   final Map<String, dynamic> data;

//   const DetailScreen({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Name: ${data['name']}'),
//             Text('Description: ${data['description']}'),
//             // ... Other data fields
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String uid = "";
  List<dynamic> historyData = [];
  List<dynamic> kendaraanData = [];

  @override
  void initState() {
    super.initState();
    getSharedPref();
    fetchData();
    // getKendaraan();
  }

  Future<void> getSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id') ?? "";
    setState(() {
      uid = userId;
    });
  }

  Future<void> fetchData() async {
    final apiUrl =
        Uri.parse('http://192.168.1.244/api-fresindo/show_gabungan.php');
    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          historyData = data;
        });
        print("Data : $historyData");
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Future<void> getKendaraan() async {
  //   final apiUrl = Uri.parse(
  //       'http://192.168.1.244/api-fresindo/show_kendaraan_by_id.php?id=2');
  //   try {
  //     final response = await http.get(apiUrl);
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         kendaraanData = data;
  //       });
  //       print("Data : $kendaraanData");
  //     } else {
  //       throw Exception('Failed to fetch data');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  final item = historyData[index];
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(
                            item['nama_supir'] ?? 'Supir Agani',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            item['asal_perusahaan'] ??
                                'PT. Lintang Emas Pasifik',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Delivery Time: ${item['create_at'] ?? 'Unknown Date'}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          'Location : ${item['alamat_pengirim'] ?? 'Unknown Location'}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement navigation to detail screen here
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            backgroundColor: Colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            'View Details',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
