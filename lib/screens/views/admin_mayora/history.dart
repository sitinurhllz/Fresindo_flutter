import 'package:flutter/material.dart';
// import 'package:fresindot_track_app/screens/views/admin_mayora/DetailDelivery.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/coba.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Mayora Group",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  "PT. Tirta Fresindo Jaya",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            const Center(
              child: Text(
                "HALAMAN HISTORY",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading:
            false, // True, untuk mengaktifkan tombol back otomatis
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Supir Agani',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'PT. Lintang Emas Pasifik',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    'Delivery Time: 14 June 2023 03.04 AM',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Text(
                    'Location : 56 street ....',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Coba()));
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder()),
                      child: const Text(
                        'View Details',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      )),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
