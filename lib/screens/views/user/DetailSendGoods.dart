// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:fresindot_track_app/screens/views/user/send_goods.dart';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
// // import 'navbar.dart';

// Future<void> postData(txtAsalPerusahaan, txtJumlah, txtNamabarang, txtFotoSurat,
//     txtNamaSupir, txtPlat) async {
//   var url = Uri.parse(
//     'http://192.168.56.1/api-fresindo/detail_pengiriman_create.php',
//   ); // Replace with your API endpoint

//   var headers = {
//     'Content-Type': 'application/x-www-form-urlencoded'
//   }; // Set your request headers
//   var body = {
//     'asal_perusahaan': txtAsalPerusahaan,
//     'nama_barang': txtNamabarang,
//     'nomor_do': text,
//     'nama_perusahaan': txtAsalPerusahaan,
//   }; // Replace with your data

//   var response = await http.post(url, headers: headers, body: (body));

//   if (response.statusCode == 200) {
//     // Request successful
//     print('Data posted successfully');
//   } else {
//     // Request failed
//     print('Failed to post data. Error: ${response.reasonPhrase}');
//   }
// }

// class DetailSendGoods extends StatefulWidget {
//   const DetailSendGoods({super.key});

//   @override
//   State<DetailSendGoods> createState() => _DetailSendGoodsState();
// }

// class _DetailSendGoodsState extends State<DetailSendGoods> {
//   String? _selectedItem;
//   List<String> _items = [];
//   String _filePath = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromServer();
//   }

//   Future<void> _pickFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       final file = File(result.files.single.path!);
//       setState(() {
//         _filePath = file.path;
//       });
//     }
//   }

//   Future<void> fetchDataFromServer() async {
//     // Replace "YOUR_API_ENDPOINT" with the actual API endpoint to fetch data from the server.
//     String apiUrl = "http://192.168.153.24/api-fresindo/show_barang.php";

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         // If the server returns a 200 OK response, parse the JSON data and update the items list.
//         List<dynamic> data = jsonDecode(response.body);
//         setState(() {
//           _items = data.cast<String>();
//         });
//       } else {
//         // If the server returns an error response, throw an exception.
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       // If an error occurs during the HTTP request, handle it here.
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController asalPerusahaan = TextEditingController();
//     TextEditingController jumlah = TextEditingController();
//     TextEditingController namaBarang = TextEditingController();
//     TextEditingController nomorDo = TextEditingController();
//     TextEditingController fotoSurat = TextEditingController();
//     TextEditingController namaSupir = TextEditingController();
//     TextEditingController plat = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Pengiriman Barang'),
//       ),
//       body: ListView(
//         children: [
//           Card(
//               margin: EdgeInsets.all(10.0),
//               elevation: 6.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Container(
//                 padding: EdgeInsets.all(14),
//                 child: Column(
//                   children: [
//                     Image(image: AssetImage("assets/images/maps.jpg")),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         ButtonBar(
//                           children: [
//                             Text(
//                               'Perum purwo gumay asri',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             ElevatedButton(
//                               child: Text('Edit'),
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const SendGoods()));
//                               },
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Text(
//                         'Padding dan Text digunakan untuk membuat subtitle navigation bar.'),
//                   ],
//                 ),
//               )),
//           Padding(padding: EdgeInsets.only(top: 20)),
//           Container(
//             margin: EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Text(
//                   'Detail Pengirim',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
// TextFormField(
//   controller: asalPerusahaan,
//   decoration: new InputDecoration(
//     hintText: "masukkan perusahaan asal pengirim",
//     labelText: "asal perusahaan",
//     prefixIcon: const Icon(
//       Icons.contact_page_rounded,
//       color: Color.fromARGB(235, 27, 147, 228),
//     ),
//   ),
// ),
//                 // TextFormField(
//                 //   controller: namaBarang,
//                 //   decoration: new InputDecoration(
//                 //     hintText: "masukkan nama barang",
//                 //     labelText: "nama barang",
//                 //     prefixIcon: const Icon(
//                 //       Icons.contact_page_rounded,
//                 //       color: Color.fromARGB(235, 27, 147, 228),
//                 //     ),
//                 //   ),
//                 // ),
//                 DropdownButton<String>(
//                   value: _selectedItem,
//                   onChanged: (newValue) {
//                     setState(() {
//                       _selectedItem = newValue;
//                     });
//                   },
//                   items: _items.map<DropdownMenuItem<String>>((String item) {
//                     return DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(item),
//                     );
//                   }).toList(),
//                 ),
//                 TextFormField(
//                   controller: nomorDo,
//                   decoration: new InputDecoration(
//                     hintText: "masukkan nomor DO",
//                     labelText: "nomor DO",
//                     prefixIcon: const Icon(
//                       Icons.contact_page_rounded,
//                       color: Color.fromARGB(235, 27, 147, 228),
//                     ),
//                   ),
//                 ),
//                 TextFormField(
//                   controller: jumlah,
//                   decoration: new InputDecoration(
//                     hintText: "masukkan Jumlah barang",
//                     labelText: "jumlah barang",
//                     prefixIcon: const Icon(
//                       Icons.contact_page_rounded,
//                       color: Color.fromARGB(235, 27, 147, 228),
//                     ),
//                   ),
//                 ),
//                 TextFormField(
//                   controller: plat,
//                   decoration: new InputDecoration(
//                     hintText: "masukkan nomor plat truk",
//                     labelText: "plat truk",
//                     prefixIcon: const Icon(
//                       Icons.contact_page_rounded,
//                       color: Color.fromARGB(235, 27, 147, 228),
//                     ),
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.only(top: 15)),
//                 Text('masukkan surat pengantar'),
//                 ElevatedButton(
//                   onPressed: _pickFile,
//                   child: Text('Choose File'),
//                 ),
//                 SizedBox(height: 16),
//                 Text('Selected file: $_filePath'),
//                 Padding(padding: EdgeInsets.only(top: 20)),
//                 TextButton(
//                     onPressed: () {
//                       String txtAsalPerusahaan = asalPerusahaan.text;
//                       String txtJumlah = jumlah.text;
//                       String txtNamabarang = namaBarang.text;
//                       String txtFotoSurat = fotoSurat.text;
//                       String txtNamaSupir = namaSupir.text;
//                       String txtPlat = plat.text;
//                       postData(txtAsalPerusahaan, txtJumlah, txtNamabarang,
//                           txtFotoSurat, txtNamaSupir, txtPlat);
//                     },
//                     style: TextButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 160),
//                         foregroundColor: Color.fromARGB(255, 255, 255, 255),
//                         backgroundColor: Colors.blue,
//                         shape: const StadiumBorder()),
//                     child: const Text('Save')),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:fresindot_track_app/screens/views/user/send_goods.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class Item {
  String id;
  String name;

  Item({required this.id, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['nama_barang'],
    );
  }
}

class Kendaraan {
  String id;
  String nama_supir;

  Kendaraan({required this.id, required this.nama_supir});

  factory Kendaraan.fromJson(Map<String, dynamic> json) {
    return Kendaraan(
      id: json['id'],
      nama_supir: json['nama_supir'],
    );
  }
}

class DetailSendGoods extends StatefulWidget {
  const DetailSendGoods({super.key});

  @override
  State<DetailSendGoods> createState() => _DetailSendGoodsState();
}

class _DetailSendGoodsState extends State<DetailSendGoods> {
  String? _selectedItemId;
  String? _selectedItemId2;
  List<Item> _items = [];
  List<Kendaraan> _kendaraanList = [];
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
    fetchDataFromServer1();
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      setState(() {
        _filePath = file.path;
      });
    }
  }

  // Your postData function here...
  Future<void> postData(txtAsalPerusahaan, txtIdBarang, txtJumlah, txtNomorDo,
      txtFotoSurat, txtIdKendaraan, txtAlamatPengirim, txtAlamatTujuan) async {
    var url = Uri.parse(
      'http://192.168.1.244/api-fresindo/detail_pengiriman_create.php',
    ); // Replace with your API endpoint

    File file = File(_filePath);
    print(_filePath);

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }; // Set your request headers
    var body = {
      'asal_perusahaan': txtAsalPerusahaan,
      'id_barang': txtIdBarang,
      'nomor_do': txtNomorDo,
      'jumlah': txtJumlah,
      'id_kendaraan': txtIdKendaraan,
      'foto_surat': txtFotoSurat,
      'alamat_pengirim': txtAlamatPengirim,
      'alamat_tujuan': txtAlamatTujuan
    }; // Replace with your data

    print(_selectedItemId2);

    var request = http.MultipartRequest('POST', url);
    request.fields['asal_perusahaan'] = txtAsalPerusahaan;
    request.fields['id_barang'] = '$_selectedItemId';
    request.fields['nomor_do'] = txtAsalPerusahaan;
    request.fields['jumlah'] = txtJumlah;
    request.fields['alamat_pengirim'] = txtAlamatPengirim;
    request.fields['alamat_tujuan'] = txtAlamatTujuan;
    request.fields['id_kendaraan'] = '$_selectedItemId2';
    // Add text data as a field
    request.files.add(http.MultipartFile(
      'gambar', // The name of the file field in the API
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: file.path.split('/').last,
    ));

    // var response = await http.post(url, headers: headers, body: (body));
    var response = await request.send();

    if (response.statusCode == 200) {
      // Request successful
      // print(response);
      var data = (response);
      print(data);
      print('Data posted successfully');
    } else {
      // Request failed
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  }

  Future<void> fetchDataFromServer() async {
    String apiUrl = "http://192.168.1.244/api-fresindo/show_barang.php";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _items = data.map((item) => Item.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDataFromServer1() async {
    String apiUrl = "http://192.168.1.244/api-fresindo/show_kendaraan.php";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _kendaraanList =
              data.map((item) => Kendaraan.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController asalPerusahaan = TextEditingController();
    TextEditingController idBarang = TextEditingController();
    TextEditingController idKendaraan = TextEditingController();
    TextEditingController nomorDo = TextEditingController();
    TextEditingController fotoSurat = TextEditingController();
    TextEditingController jumlah = TextEditingController();
    TextEditingController alamatPengirim = TextEditingController();
    TextEditingController alamatTujuan = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengiriman Barang'),
      ),
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: alamatPengirim,
                  // autofocus: true,
                  decoration: new InputDecoration(
                    labelText: "Asal Lokasi Pengiriman...",
                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: Color.fromARGB(235, 27, 147, 228),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 13)),
                TextFormField(
                  controller: alamatTujuan,
                  // autofocus: true,
                  decoration: new InputDecoration(
                    labelText: "Tujuan Lokasi Pengiriman...",
                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: Color.fromARGB(235, 27, 147, 228),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
                const Text(
                  'Detail Pengirim',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: asalPerusahaan,
                  decoration: new InputDecoration(
                    hintText: "masukkan perusahaan asal pengirim",
                    labelText: "asal perusahaan",
                    prefixIcon: const Icon(
                      Icons.business,
                      color: Color.fromARGB(235, 27, 147, 228),
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: DropdownButton<String>(
                      value: _selectedItemId,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItemId = newValue;
                        });
                      },
                      items: _items.map<DropdownMenuItem<String>>(
                        (Item item) {
                          return DropdownMenuItem<String>(
                            value: item.id,
                            child: Text(item.name),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                TextFormField(
                  controller: nomorDo,
                  decoration: const InputDecoration(
                    hintText: "masukkan nomor DO",
                    labelText: "nomor DO",
                    prefixIcon: Icon(
                      Icons.contact_page_rounded,
                      color: Color.fromARGB(235, 27, 147, 228),
                    ),
                  ),
                ),
                TextFormField(
                  controller: jumlah,
                  decoration: const InputDecoration(
                    hintText: "masukkan Jumlah barang",
                    labelText: "jumlah barang",
                    prefixIcon: Icon(
                      Icons.contact_page_rounded,
                      color: Color.fromARGB(235, 27, 147, 228),
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: DropdownButton<String>(
                      value: _selectedItemId2,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItemId2 = newValue;
                          print(_selectedItemId2);
                        });
                      },
                      items: _kendaraanList.map<DropdownMenuItem<String>>(
                        (Kendaraan kendaraan) {
                          return DropdownMenuItem<String>(
                            value: kendaraan.id,
                            child: Text(kendaraan.nama_supir),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                const Text('masukkan surat pengantar'),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: const Text('Choose File'),
                ),
                const SizedBox(height: 16),
                Text('Selected file: $_filePath'),
                const Padding(padding: EdgeInsets.only(top: 20)),
                TextButton(
                  onPressed: () {
                    String txtAsalPerusahaan = asalPerusahaan.text;
                    String txtNomorDo = nomorDo.text;
                    String txtIdBarang = idBarang.text;
                    String txtIdKendaraan = idKendaraan.text;
                    String txtJumlah = jumlah.text;
                    String txtFotoSurat = fotoSurat.text;
                    String txtAlamatPengirim = alamatPengirim.text;
                    String txtAlamatTujuan = alamatTujuan.text;

                    postData(
                        txtAsalPerusahaan,
                        txtIdBarang,
                        txtJumlah,
                        txtNomorDo,
                        txtFotoSurat,
                        txtIdKendaraan,
                        txtAlamatPengirim,
                        txtAlamatTujuan);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 160,
                    ),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Save'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DetailSendGoods(),
  ));
}
