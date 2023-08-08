import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/EditBarang.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataBarang extends StatefulWidget {
  const DataBarang({super.key});

  @override
  State<DataBarang> createState() => _DataBarangState();
}

class _DataBarangState extends State<DataBarang> {
  List<dynamic> barangData = [];

  Future<void> fetchData() async {
    Uri apiUrl = Uri.parse('http://192.168.1.244/api-fresindo/show_barang.php');
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          barangData = data;
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
    var url = Uri.parse('http://192.168.1.244/api-fresindo/delete_barang.php');
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
            "DATA BARANG",
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
            columnSpacing: 10, // Reduce spacing between columns
            columns: const [
              DataColumn(
                label: Text(
                  'Nama Barang',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Satuan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Keterangan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Actions',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
            rows: barangData.map<DataRow>((item) {
              return DataRow(cells: [
                DataCell(Text(
                  item['nama_barang'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                )),
                DataCell(Text(
                  item['satuan'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                )),
                DataCell(Text(
                  item['keterangan'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                )),
                DataCell(Row(
                  children: [
                    SizedBox(
                      width: 10,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditBarang(
                                id: int.parse(
                                    item['id']), // Use item['id'] here
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    SizedBox(
                      width: 10,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteDataBarang(item['id']);
                        },
                      ),
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
