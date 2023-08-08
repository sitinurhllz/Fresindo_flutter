import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataKendaraan.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class EditKendaraan extends StatefulWidget {
  final int id;
  const EditKendaraan({Key? key, required this.id}) : super(key: key);

  @override
  State<EditKendaraan> createState() => _EditKendaraanState();
}

class _EditKendaraanState extends State<EditKendaraan> {
  TextEditingController namaSupir = TextEditingController();
  TextEditingController plat = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var url = Uri.parse(
        'http://192.168.1.244/api-fresindo/show_kendaraan_by_id.php?id=${widget.id}');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        namaSupir.text = data['nama_supir'];
        plat.text = data['plat'];
    
      });
      final snackBar = SnackBar(
        content: Text('Fetch Data Berhasil !!'),
        duration: Duration(seconds: 3), // Optional: Set the duration
      );
      // Request successful
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print('Failed to fetch data. Error: ${response.reasonPhrase}');
    }
  }

  Future<void> updateData(
      String namaSupir, String plat) async {
    var url = Uri.parse('http://192.168.1.244/api-fresindo/kendaraan_update.php');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'id': widget.id.toString(),
      'nama_supir': namaSupir,
      'plat': plat,
    };

    print("body data post : ${body}");
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text('Update Data Berhasil !!'),
        duration: Duration(seconds: 3), // Optional: Set the duration
      );
      // Request successful
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Data updated successfully');
      // Tampilkan notifikasi atau lakukan tindakan lain setelah pembaruan berhasil
    } else {
      print('Failed to update data. Error: ${response.reasonPhrase}');
      // Tampilkan pesan kesalahan atau lakukan tindakan lain jika pembaruan gagal
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            "EDIT DATA KENDARAAN",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              child: Lottie.asset(
                'assets/lottie/profile-animation.json',
                height: 150,
                width: 150,
              ),
            ),
            // const Text(
            //   'Update Kendaraan',
            //   style: TextStyle(
            //     fontFamily: 'Pacifico',
            //     fontSize: 40.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.blueAccent,
            //   ),
            // ),
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
                labelText: "plat",
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
                updateData(
                  namaSupir.text,
                  plat.text,
                );
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
