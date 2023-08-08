import 'package:flutter/material.dart';

class ProfilKaryawan extends StatefulWidget {
  const ProfilKaryawan({super.key});

  @override
  State<ProfilKaryawan> createState() => _ProfilKaryawanState();
}

class _ProfilKaryawanState extends State<ProfilKaryawan> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [Colors.blue, Colors.red],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Profile Karyawan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: height * 0.4,
                    child: LayoutBuilder(builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.65,
                              width: innerWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                                child: Column(
                                  children: const [
                                    SizedBox(
                                      height: 90,
                                    ),
                                    Text('Nama Karyawan',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    )),
                                    Text('NIK Karyawan',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                                    Padding(padding: EdgeInsets.only(top: 15))
                                  ],
                                ),
                            ),
                          ),
                          Positioned(
                            bottom: 150,
                            top: 60,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                                width: 70,
                                height: 50,
                                child: CircleAvatar(
                                  child:
                                      Image.asset('assets/images/profile.png'),
                                )),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}