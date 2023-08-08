import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataUser.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class EditDataUser extends StatefulWidget {
  final int id;

  const EditDataUser({Key? key, required this.id}) : super(key: key);

  @override
  _EditDataUserState createState() => _EditDataUserState();
}

class _EditDataUserState extends State<EditDataUser> {
  TextEditingController namaPerusahaan = TextEditingController();
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController jabatan = TextEditingController();
  TextEditingController alamatPerusahaan = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var url = Uri.parse(
        'http://192.168.1.244/api-fresindo/show_user_by_id.php?id=${widget.id}');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        namaPerusahaan.text = data['nama_perusahaan'];
        namaLengkap.text = data['nama_lengkap'];
        nik.text = data['nik'];
        noHp.text = data['no_hp'];
        jabatan.text = data['jabatan'];
        alamatPerusahaan.text = data['alamat_perusahaan'];
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

  Future<void> updateData(String namaLengkap, String namaPerusahaan,
      String noHp, String nip, String jabatan, String alamatPerusahaan) async {
    var url = Uri.parse('http://192.168.1.244/api-fresindo/user_update.php');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'id': widget.id.toString(),
      'nama_perusahaan': namaPerusahaan,
      'nama_lengkap': namaLengkap,
      'no_hp': noHp,
      'nip': nip,
      'jabatan': jabatan,
      'alamat_perusahaan': alamatPerusahaan,
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
                    "EDIT DATA USER",
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // const Text(
            //   'Create User Form',
            //   style: TextStyle(
            //     fontFamily: 'Pacifico',
            //     fontSize: 40.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.blueAccent,
            //   ),
            // ),
            Container(
              child: Lottie.asset(
                'assets/lottie/edituser.json',
                height: 150,
                width: 150,
              ),
            ),
            TextFormField(
              controller: namaPerusahaan,
              decoration: InputDecoration(
                labelText: 'Asal Perusahaan',
                prefixIcon: const Icon(Icons.corporate_fare_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: namaLengkap,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                prefixIcon: const Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: noHp,
              decoration: InputDecoration(
                labelText: 'Nomor Telphone Perusahaan',
                prefixIcon: const Icon(Icons.mobile_friendly),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: nik,
              decoration: InputDecoration(
                labelText: 'NIP',
                prefixIcon: const Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: jabatan,
              decoration: InputDecoration(
                labelText: 'Jabatan',
                prefixIcon: const Icon(Icons.chair),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: alamatPerusahaan,
              decoration: InputDecoration(
                labelText: 'Alamat Perusahaan',
                prefixIcon: const Icon(Icons.corporate_fare),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                updateData(namaLengkap.text, namaPerusahaan.text, noHp.text,
                    nik.text, jabatan.text, alamatPerusahaan.text);
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataUser(),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
