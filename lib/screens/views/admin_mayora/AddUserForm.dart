import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DataUser.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

Future<void> postData(txtNamaPerusahaan, txtNamaLengkap, txtNoHp, txtNik,
    txtJabatan, txtAlamatPerusahaan, txtPassword, BuildContext context) async {
  var url = Uri.parse(
      'http://192.168.1.244/api-fresindo/user_create.php'); // Replace with your API endpoint

  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  }; // Set your request headers
  var body = {
    'nama_perusahaan': txtNamaPerusahaan,
    'nama_lengkap': txtNamaLengkap,
    'no_hp': txtNoHp,
    'nip': txtNik,
    'jabatan': txtJabatan,
    'alamat_perusahaan': txtAlamatPerusahaan,
    'password_user': txtPassword
  }; // Replace with your data

  var response = await http.post(url, headers: headers, body: (body));

  if (response.statusCode == 200) {
    final snackBar = SnackBar(
      content: Text('MendaftarKan Berhasil !!'),
      duration: Duration(seconds: 3), // Optional: Set the duration
    );
    // Request successful
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    // Request failed
    print('Failed to post data. Error: ${response.reasonPhrase}');
  }
}

class AddUserForm extends StatefulWidget {
  const AddUserForm({Key? key}) : super(key: key);

  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  // final items = ['item 1', 'item 2', 'item 3'];

  @override
  Widget build(BuildContext context) {
    TextEditingController namaPerusahaan = TextEditingController();
    TextEditingController namaLengkap = TextEditingController();
    TextEditingController nik = TextEditingController();
    TextEditingController noHp = TextEditingController();
    TextEditingController jabatan = TextEditingController();
    TextEditingController alamatPerusahaan = TextEditingController();
    TextEditingController passwordUser = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
                    "TAMBAH DATA USER",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
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
            // Center(
            //   child: const Text(
            //     'Tambah User',
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
              controller: namaPerusahaan,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: "Asal Perusahaan",
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
              controller: namaLengkap,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                prefixIcon: const Icon(
                  Icons.people,
                  color: Color.fromARGB(235, 27, 147, 228),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              // autofocus: true,
              controller: nik,
              decoration: InputDecoration(
                labelText: "Nomor Telphone Perusahaan",
                prefixIcon: const Icon(
                  Icons.mobile_friendly,
                  color: Color.fromARGB(235, 27, 147, 228),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              // autofocus: true,
              controller: noHp,
              decoration: InputDecoration(
                labelText: "NIK",
                prefixIcon: const Icon(
                  Icons.people,
                  color: Color.fromARGB(235, 27, 147, 228),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              // autofocus: true,
              controller: jabatan,
              decoration: InputDecoration(
                labelText: "Jabatan",
                prefixIcon: const Icon(
                  Icons.chair,
                  color: Color.fromARGB(235, 27, 147, 228),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              // autofocus: true,
              controller: alamatPerusahaan,
              decoration: InputDecoration(
                labelText: "Alamat Perusahaan",
                prefixIcon: const Icon(
                  Icons.corporate_fare,
                  color: Color.fromARGB(235, 27, 147, 228),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              // autofocus: true,
              controller: passwordUser,
              decoration: InputDecoration(
                labelText: "Password User",
                prefixIcon: const Icon(
                  Icons.password,
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
                String txtNamaPerusahaan = namaPerusahaan.text;
                String txtNamaLengkap = namaLengkap.text;
                String txtNoHp = noHp.text;
                String txtNip = nik.text;
                String txtJabatan = jabatan.text;
                String txtAlamatPerusahaan = alamatPerusahaan.text;
                String txtPasswordUser = passwordUser.text;
                // Perform form submission
                postData(txtNamaPerusahaan, txtNamaLengkap, txtNoHp, txtNip,
                    txtJabatan, txtAlamatPerusahaan, txtPasswordUser, context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataUser(),
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
