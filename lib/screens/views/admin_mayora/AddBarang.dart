import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataBarang.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

Future<void> postData(
    txtNamaBarang, txtSatuan, txtKeterangan, BuildContext context) async {
  var url = Uri.parse(
      'http://192.168.1.244/api-fresindo/create_barang.php'); // Replace with your API endpoint

  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  }; // Set your request headers
  var body = {
    'nama_barang': txtNamaBarang,
    'satuan': txtSatuan,
    'keterangan': txtKeterangan,
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

class AddBarang extends StatefulWidget {
  const AddBarang({super.key});

  @override
  State<AddBarang> createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namaBarang = TextEditingController();
    TextEditingController satuan = TextEditingController();
    TextEditingController keterangan = TextEditingController();

    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
                    "TAMBAH DATA BARANG",
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
            // Center(
            //   child: const Text(
            //     'Tambah Barang',
            //     style: TextStyle(
            //       fontFamily: 'Pacifico',
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.blueAccent,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20.0),
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
                String txtNamaBarang = namaBarang.text;
                String txtSatuan = satuan.text;
                String txtKeterangan = keterangan.text;

                // Perform form submission
                postData(txtNamaBarang, txtSatuan, txtKeterangan,
                 context);
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
