import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataBarang.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class EditBarang extends StatefulWidget {
  final int id;
  const EditBarang({Key? key, required this.id}) : super(key: key);

  @override
  State<EditBarang> createState() => _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {
  TextEditingController namaBarang = TextEditingController();
  TextEditingController satuan = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var url = Uri.parse(
        'http://192.168.1.244/api-fresindo/show_barang_by_id.php?id=${widget.id}');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        namaBarang.text = data['nama_barang'];
        satuan.text = data['satuan'];
        keterangan.text = data['keterangan'];
      });
      final snackBar = const SnackBar(
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
      String namaBarang, String satuan, String keterangan) async {
    var url = Uri.parse('http://192.168.1.244/api-fresindo/update_barang.php');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'id': widget.id.toString(),
      'nama_barang': namaBarang,
      'satuan': satuan,
      'keterangan': keterangan,
    };

    print("body data post : ${body}");
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final snackBar = const SnackBar(
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
                    "EDIT DATA BARANG",
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
            //   'Update Barang',
            //   style: TextStyle(
            //     fontFamily: 'Pacifico',
            //     fontSize: 40.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.blueAccent,
            //   ),
            // ),
            TextFormField(
              controller: namaBarang,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: "Nama Barang",
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
              controller: satuan,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: "satuan",
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
              controller: keterangan,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: "Keterangan",
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
                  namaBarang.text,
                  satuan.text,
                  keterangan.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataBarang(),
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
