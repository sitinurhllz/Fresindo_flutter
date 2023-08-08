import 'package:flutter/material.dart';
import 'package:fresindot_track_app/model/User_Model.dart';
import 'package:fresindot_track_app/provider/Auth_Provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // Create a global form key

  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String notify = '';
  final AuthProvider authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bglogin.png"),
            fit: BoxFit.cover, // You can adjust the fit as per your preference
          ),
        ),
        // Your background image and layout code
        child: Form(
          key: _formKey, // Assign the form key to the Form widget
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
            margin: const EdgeInsets.only(top: 80),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Image(
                      image: AssetImage("assets/images/fresindotrack.png")),
                )
              ],
            ),
          ),
                  // Your input fields wrapped with Containers
                  Container(
                    margin: EdgeInsets.only(top: 320),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              "Input your account login on below!",
                              style: TextStyle(
                                fontFamily: 'Domine',
                                fontSize: 20,
                                  
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(235, 27, 147, 228),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(5),
                          child: SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: nikController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Masukkan Nik",
                                labelText: "NIK",
                                prefixIcon: const Icon(
                                  Icons.perm_contact_cal_rounded,
                                  color: Color.fromARGB(235, 27, 147, 228),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'NIK cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(5),
                          child: SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: passwordController,
                              textAlign: TextAlign.center,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Masukkan Password",
                                labelText: "Password",
                                prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Color.fromARGB(235, 27, 147, 228),
                    ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Text(notify),

                        
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              backgroundColor: Colors.blue,
                              shape: const StadiumBorder()),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // All input fields are valid
                              // You can access the values through the controllers
                              String nik = nikController.text;
                              String password = passwordController.text;
                              // Process the data, e.g., perform login
                              UserModel userModel =
                                  UserModel(nik: nik, password: password);

                              authProvider.login(userModel, context);
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
