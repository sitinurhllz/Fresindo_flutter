import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return 
      
      // fit: StackFit.expand,
      // children: [
        // Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: FractionalOffset.bottomCenter,
        //       end: FractionalOffset.topCenter,
        //       colors: [Colors.blue, Colors.red],
        //     ),
        //   ),
        // ),
        Scaffold(
          backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Mayora Group",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'Poppins',
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  "PT. Tirta Fresindo Jaya",
                  style: TextStyle(
                    color: Colors.blueAccent,
                     fontFamily: 'Poppins',
                    fontSize: 15.0,
                  ),
                ),
              ],
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
          // backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Profile User',
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Domine',
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
                                    Text('Budi Sutoni',
                                    style: TextStyle(
                                       fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 25,
                                    )),
                                    Text('197652836484',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
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
      //   )
      // ],
    );
  }
}