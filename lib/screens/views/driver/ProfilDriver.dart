// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ProfilDriver extends StatefulWidget {
//   const ProfilDriver({super.key});

//   @override
//   State<ProfilDriver> createState() => _ProfilDriverState();
// }

// class _ProfilDriverState extends State<ProfilDriver> {
//   List<dynamic> ProfileDriver = [];
//   Future<void> fetchData() async {
//     var Url = Uri.parse('http://192.168.1.244/api-fresindo/show_user.php');

//     try {
//       var response = await http.get(Url);

//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         print(data);
//         setState(() {
//           ProfileDriver = data;
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
//     // if (ProfileDriver == null) {
//     //   return const Center(child: CircularProgressIndicator());
//     // } else {
//     //   print("${ProfileDriver?['nama_lengkap']}");
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Column(
//           children: [
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: const [
//             //     // Image(
//             //     //       image: AssetImage("assets/images/fresindotrack.png",), height: 20, width: 20,),
//             //   ],
//             // ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Text(
//                   "Mayora Group",
//                   style: TextStyle(
//                     color: Colors.blueAccent,
//                     fontSize: 15.0,
//                   ),
//                 ),
//                 Text(
//                   "PT. Tirta Fresindo Jaya",
//                   style: TextStyle(
//                     color: Colors.blueAccent,
//                     fontSize: 15.0,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         automaticallyImplyLeading:
//             false, // True, untuk mengaktifkan tombol back otomatis
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(25),
//                 bottomRight: Radius.circular(25))),
//       ),
//       body: Column(
//         children: [
//           Image(image: AssetImage("assets/images/profile.png",), height: 80, width: 80,),
//           Padding(padding: EdgeInsets.only(top: 10.0)),
//           Card(
//             margin: EdgeInsets.all(12.0),
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     'Nama Lengkap',
//                     style: const TextStyle(
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 10.0)),
//                   Text(
//                     'Asal Perusahaan',
//                     style: const TextStyle(
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 10.0)),
//                   Text(
//                     'NIK',
//                     style: const TextStyle(
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ],
//               ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilDriver extends StatefulWidget {
  const ProfilDriver({Key? key}) : super(key: key);

  @override
  State<ProfilDriver> createState() => _ProfilDriverState();
}

class _ProfilDriverState extends State<ProfilDriver> {
  Map<String, dynamic> profileData = {}; // Use Map for storing single user profile data

  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.1.244/api-fresindo/show_user.php');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        setState(() {
          profileData = data[0]; // Assuming you get a list of profiles and want the first one
        });

        final snackBar = const SnackBar(
          content: Text('Fetch Data Berhasil !!'),
          duration: Duration(seconds: 3), // Optional: Set the duration
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Gagal memuat data.');
        final snackBar = const SnackBar(
          content: Text('Fetch Data Gagal !!'),
          duration: Duration(seconds: 3), // Optional: Set the duration
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Fetch Data Gagal Error : $e'),
        duration: const Duration(seconds: 3), // Optional: Set the duration
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
                    fontFamily: 'Poppins',
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  "PT. Tirta Fresindo Jaya",
                  style: TextStyle(
                    color: Colors.blueAccent,
                     fontFamily: 'Poppins',
                    fontSize: 15.0,
                  ),
                ),
              ],
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
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Text(
                    'Profil Supir',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Domine'
                      
                    ),
                  ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Image(image: AssetImage("assets/images/profile.png"), height: 100, width: 100),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                
                // margin: EdgeInsets.all(12.0),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Budi Sutoni',
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    // Text(
                    //   'Budi Sutoni',
                    //   // profileData['nama_lengkap'] ?? 'Unknown', // Use profileData to display user data
                    //   style: const TextStyle(
                    //     fontSize: 10.0,
                    //   ),
                    // ),
                    // Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      'Mayora',
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    // Text(
                    //   profileData['asal_perusahaan'] ?? 'Unknown', // Use profileData to display user data
                    //   style: const TextStyle(
                    //     fontSize: 10.0,
                    //   ),
                    // ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      '1678524376',
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    // Text(
                    //   profileData['nik'] ?? 'Unknown', // Use profileData to display user data
                    //   style: const TextStyle(
                    //     fontSize: 10.0,
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilDriver(),
  ));
}
