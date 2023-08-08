// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class BarcodeScannerScreen extends StatefulWidget {
//   const BarcodeScannerScreen({super.key});

//   @override
//   State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
// }

// class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
//   late String dataBarcode;

//   Future<void> scanBarcode() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         "#FF0000", // Warna tampilan pemindaian
//         "Batal", // Label tombol untuk membatalkan pemindaian
//         true, // Apakah harus menampilkan tampilan pemindaian dengan flashlight
//         ScanMode.BARCODE, // Mode pemindaian (Bisa juga menggunakan QR)
//       );
//     } catch (e) {
//       barcodeScanRes = 'Error: $e';
//     }
//     // print('Hasil pemindaian: $barcodeScanRes');

//     setState(() {
//       dataBarcode = barcodeScanRes;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scan Barang')),
//       body: Center(
//           child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () => scanBarcode(),
//             child: const Text('Pindai Barcode'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               print("data setstate : ${dataBarcode}");
//             },
//             child: const Text('Confirmation'),
//           ),
//         ],
//       )),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

class BarcodeScannerScreen extends StatefulWidget {
  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  late String dataBarcode;

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FF0000", // Warna tampilan pemindaian
        "Batal", // Label tombol untuk membatalkan pemindaian
        true, // Apakah harus menampilkan tampilan pemindaian dengan flashlight
        ScanMode.BARCODE, // Mode pemindaian (Bisa juga menggunakan QR)
      );
    } catch (e) {
      barcodeScanRes = 'Error: $e';
    }
    setState(() {
      dataBarcode = barcodeScanRes;
    });
  }

  Future<void> postData(String key) async {
    final Uri uri = Uri.parse(
        'http://192.168.1.244/api-fresindo/show_detail_pengiriman_by_id.php'); // Include your query parameters here

    // Replace the below JSON with your request body
    final Map<String, dynamic> requestBody = {
      'key1': key,
    };

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json', // Set your desired headers here
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('POST request successful! Response: ${response.body}');
    } else {
      print('POST request failed. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan Barang')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () => scanBarcode(),
            child: Text('Pindai Barcode'),
          ),
          ElevatedButton(
            onPressed: () {
              postData(dataBarcode);
              print("data setstate : ${dataBarcode}");
            },
            child: Text('Confirmation'),
          ),
        ],
      )),
    );
  }
}