// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//    List<dynamic> dashboardData = [];

//   Future<void> fetchData() async {
//     var url = Uri.parse('http://192.168.153.24/api-fresindo/show_user.php');
//     try {
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         print(data);
//         setState(() {
//           dashboardData = data;
//         });

//         final snackBar = SnackBar(
//           content: Text('Fetch Data Berhasil !!'),
//           duration: Duration(seconds: 3),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       } else {
//         print('Gagal memuat data.');
//         final snackBar = SnackBar(
//           content: Text('Fetch Data Gagal !!'),
//           duration: Duration(seconds: 3),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     } catch (e) {
//       final snackBar = SnackBar(
//         content: Text('Fetch Data Gagal Error : $e'),
//         duration: Duration(seconds: 3),
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
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: FractionalOffset.bottomCenter,
//               end: FractionalOffset.topCenter,
//               colors: [Colors.blue, Colors.red],
//             ),
//           ),
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'Profile Admin',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontFamily: 'Nisebuschgardens',
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: height * 0.4,
//                     child: LayoutBuilder(builder: (context, constraints) {
//                       double innerHeight = constraints.maxHeight;
//                       double innerWidth = constraints.maxWidth;
//                       return Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           Positioned(
//                             bottom: 0,
//                             left: 0,
//                             right: 0,
//                             child: Container(
//                               height: innerHeight * 0.65,
//                               width: innerWidth,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: Colors.white,
//                               ),
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 90,
//                                     ),
//                                     Text('Nama Admin',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 25,
//                                     )),
//                                     Text('Asal Perusaaan',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                     )),
//                                     Padding(padding: EdgeInsets.only(top: 15))
//                                   ],
//                                 ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 150,
//                             top: 60,
//                             left: 0,
//                             right: 0,
//                             child: SizedBox(
//                                 width: 70,
//                                 height: 50,
//                                 child: CircleAvatar(
//                                   child:
//                                       Image.asset('assets/images/profile.png'),
//                                 )),
//                           ),
                          
//                         ],
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<dynamic> dashboardData = [];

  Future<void> fetchData() async {
    var url = Uri.parse('http://DetailSendGoods/api-fresindo/show_user.php');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          dashboardData = data;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [Colors.blue, Colors.red],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Profile Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: height * 0.4,
                    child: LayoutBuilder(builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.65,
                              width: innerWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 90,
                                  ),
                                  Text(
                                    'Nama User: ${dashboardData.isNotEmpty ? dashboardData[0]['nama_lengkap'] : '-'}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    'Asal Perusahaan: ${dashboardData.isNotEmpty ? dashboardData[0]['asal_perusahaan'] : '-'}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.only(top: 15))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 150,
                            top: 60,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              width: 70,
                              height: 50,
                              child: CircleAvatar(
                                child: Image.asset('assets/images/profile.png'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
