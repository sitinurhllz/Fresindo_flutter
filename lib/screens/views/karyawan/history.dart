import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/DetailDelivery.dart';

class HistoryKaryawan extends StatefulWidget {
  const HistoryKaryawan({super.key});

  @override
  State<HistoryKaryawan> createState() => _HistoryKaryawanState();
}

class _HistoryKaryawanState extends State<HistoryKaryawan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.all(20.0), 
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        color: Colors.cyanAccent,
                        width: 80.0,
                        height: 80.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        color: Colors.blueAccent,
                        width: 80.0,
                        height: 80.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        color: Colors.orangeAccent,
                        width: 80.0,
                        height: 80.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Card(
              margin: const EdgeInsets.all(20.0), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Supir Agani'),
                  subtitle: Text('PT. Lintang Emas Pasifik'),
                ),
                const Text('Delivery Time: 14 June 2023 03.04 AM'),
                const Text('Location : 56 street ....'),
                
                TextButton(
                      onPressed: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailDelivery(id: 1,)));
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder()),
                      child: const Text('View Details')),
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
