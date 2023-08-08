import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/EditDataUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

class DataUser extends StatefulWidget {
  const DataUser({Key? key}) : super(key: key);

  @override
  State<DataUser> createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  List<dynamic> userData = [];

  Future<void> fetchData() async {
    Uri apiUrl = Uri.parse('http://192.168.1.244/api-fresindo/show_user.php');
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        setState(() {
          userData = data;
        });

        final snackBar = const SnackBar(
          content: Text('Fetch Data Berhasil !!'),
          duration: Duration(seconds: 3), // Optional: Set the duration
        );
        // Request successful
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Gagal memuat data.');
        final snackBar = const SnackBar(
          content: Text('Fetch Data Gagal !!'),
          duration: Duration(seconds: 3), // Optional: Set the duration
        );
        // Request successful
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Fetch Data Gagal Error : $e'),
        duration: const Duration(seconds: 3), // Optional: Set the duration
      );
      // Request successful
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Terjadi kesalahan dalam memuat data: $e');
    }
  }

  Future<void> DeleteDataUser(String id) async {
    var url = Uri.parse('http://192.168.1.244/api-fresindo/user_delete.php');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'id': id,
    };

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final snackBar = const SnackBar(
        content: Text('Delete Data Berhasil !!'),
        duration: Duration(seconds: 3), // Optional: Set the duration
      );
      // Request successful
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Data deleted successfully');
      // Tampilkan notifikasi atau lakukan tindakan lain setelah pembaruan berhasil
    } else {
      print('Failed to delete data. Error: ${response.reasonPhrase}');
      // Tampilkan pesan kesalahan atau lakukan tindakan lain jika pembaruan gagal
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            "DATA USER",
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
      body: Container(
        color: Colors.blueAccent,
        child: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Lottie.asset(
                      'assets/lottie/profile2.json',
                      height: 50,
                      width: 50,
                    ),
                    title: Text(
                      userData[index]['nama_lengkap'],
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      userData[index]['nama_perusahaan'],
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No. Telephone PT : ${userData[index]['no_hp'] ?? '-'},',
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'NIK User : ${userData[index]['nik'] ?? '-'}',
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Jabatan : ${userData[index]['jabatan'] ?? '-'}',
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'Alamat Perusahaan : ${userData[index]['alamat_perusahaan'] ?? '-'}',
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(left: 15.0)),
                      Column(
                        children: [
                          ElevatedButton(
                            child: const Text('Edit'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => EditDataUser(
                                            id: int.parse(
                                                userData[index]['id']),
                                          )));
                            },
                          ),
                          ElevatedButton(
                            child: const Icon(Icons.delete),
                            onPressed: () {
                              DeleteDataUser(userData[index]['id']);
                              fetchData();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
