import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/EditKendaraan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataKendaraan extends StatefulWidget {
  const DataKendaraan({super.key});

  @override
  State<DataKendaraan> createState() => _DataKendaraanState();
}

class _DataKendaraanState extends State<DataKendaraan> {
  List<dynamic> kendaraanData = [];

  Future<void> fetchData() async {
    Uri apiUrl =
        Uri.parse('http://192.168.1.244/api-fresindo/show_kendaraan.php');
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          kendaraanData = data;
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

  Future<void> deleteDataBarang(String id) async {
    var url =
        Uri.parse('http://192.168.1.244/api-fresindo/kendaraan_delete.php');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'id': id,
    };

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final snackBar = const SnackBar(
        content: Text('Delete Data Berhasil !!'),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Data deleted successfully');
      setState(() {
        fetchData(); // Reload data after deletion
      });
    } else {
      print('Failed to delete data. Error: ${response.reasonPhrase}');
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
            "DATA KENDARAAN",
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
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(
                  label: Text(
                'Nama Supir',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataColumn(
                  label: Text(
                'Plat',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataColumn(
                  label: Text(
                'Actions',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
            rows: kendaraanData.map<DataRow>((item) {
              return DataRow(cells: [
                DataCell(Text(
                  item['nama_supir'],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )),
                DataCell(Text(
                  item['plat'],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditKendaraan(
                              id: int.parse(item['id']), // Use item['id'] here
                            ),
                          ),
                        );
                        // Handle edit functionality here
                        // print('Edit button pressed for ${item['']}');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteDataBarang(item['id']);
                      },
                    )
                  ],
                )),
              ]);
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
