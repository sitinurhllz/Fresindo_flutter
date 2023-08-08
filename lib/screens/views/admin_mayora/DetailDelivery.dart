import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/history.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailDelivery extends StatefulWidget {
  final int id;
  // const DetailDelivery({super.key});
  const DetailDelivery({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailDelivery> createState() => _DetailDeliveryState();
}

class _DetailDeliveryState extends State<DetailDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detail Delivery',
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        const ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Supir Agani'),
                          subtitle: Text('PT. Lintang Emas Pasifik'),
                        ),
                        const Text(
                          'Scan Here',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: 140.0,
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                              child: const Text('Tracking'),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const ()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(padding: EdgeInsets.all(10.0)),
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Detail Pengiriman',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'Asal Perusahaan : PT. Lintang Emas Pasifik',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'No.Telp PT : 0711-6767-9023',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'No. DO : NP835H6284YU638',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'Nama Supir',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'No HP Supir : 0856-1234-9898',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'Nomor Plat : BN-1899-WR',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'Nama Barang : Le Mineral Botol',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'Jumlah : 1500 Pcs',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        const Text(
                          'Status Pengiriman : Sedang Dalam Perjalanan',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 8.0)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const History()));
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 150),
                        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Colors.blue,
                        shape: const StadiumBorder()),
                    child: const Text('Validasi')),
                const SizedBox(height: 20),
              ],
            )
          ],
        ));
  }
}
