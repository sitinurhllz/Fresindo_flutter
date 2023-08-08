import 'package:flutter/material.dart';
import 'package:fresindot_track_app/screens/views/admin_mayora/dashboard.dart';


class Login_Admin extends StatefulWidget {
  const Login_Admin({super.key});

  @override
  State<Login_Admin> createState() => _Login_AdminState();
}

class _Login_AdminState extends State<Login_Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bglogin.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 70),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: Image(
                      image: AssetImage("assets/images/fresindotrack.png")),
                )
              ],
            ),
          ),
          ListView(
            children: [
              Container(
              margin: const EdgeInsets.only(top: 530),
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "masukan NIP anda",
                      labelText: "NIP",
                      prefixIcon: const Icon(
                        Icons.people,
                        color: Color.fromARGB(235, 27, 147, 228),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  TextFormField(
                    
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      suffix: const Icon(Icons.visibility),
                      hintText: "masukkan password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      labelText: "Password",
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Color.fromARGB(235, 27, 147, 228),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()));
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder()),
                      child: const Text('Login')),
                  const SizedBox(height: 20),
                ],
              )
            ),
            ],
          )
        ],
      ),
    );
  }
}