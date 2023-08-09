import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataKendaraan.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

Future<void> postData(txtNamaSupir, txtPlat, BuildContext context) async {
  var url = Uri.parse(
      'http://192.168.1.244/api-fresindo/kendaraan_create.php'); // Replace with your API endpoint

  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  }; // Set your request headers
  var body = {
    'nama_supir': txtNamaSupir,
    'plat': txtPlat,
  }; // Replace with your data

  var response = await http.post(url, headers: headers, body: (body));

  if (response.statusCode == 200) {
    final snackBar = SnackBar(
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

class AddKendaraan extends StatefulWidget {
  const AddKendaraan({super.key});

  @override
  State<AddKendaraan> createState() => _AddKendaraanState();
}

class _AddKendaraanState extends State<AddKendaraan> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namaSupir = TextEditingController();
    TextEditingController plat = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "TAMBAH DATA KENDARAAN",
            style: TextStyle(
              color: Colors.blueAccent,
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // Center(
            //   child: const Text(
            //     'Tambah Kendaraan',
            //     style: TextStyle(
            //       fontFamily: 'Pacifico',
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.blueAccent,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20.0),
            Container(
              child: Lottie.asset(
                'assets/lottie/profile-animation.json',
                height: 150,
                width: 150,
              ),
            ),
            TextFormField(
              controller: namaSupir,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: "Nama Supir",
                prefixIcon: const Icon(
                  Icons.corporate_fare_outlined,
                  color: Color.fromARGB(235, 27, 147, 228),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: plat,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: "Plat",
                prefixIcon: const Icon(
                  Icons.corporate_fare_outlined,
                  color: Color.fromARGB(235, 27, 147, 228),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

            const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                String txtNamaSupir = namaSupir.text;
                String txtPlat = plat.text;

                // Perform form submission
                postData(txtNamaSupir, txtPlat, context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataKendaraan(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                primary: Colors.white,
                backgroundColor: Colors.blue,
                shape: const StadiumBorder(),
              ),
              child: const Text('Save'),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
