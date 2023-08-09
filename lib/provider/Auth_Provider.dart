import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../model/User_Model.dart';

class AuthProvider extends ChangeNotifier {
  //user

  Future<void> login(UserModel user, BuildContext context) async {
    final url = "http://192.168.1.244/api-fresindo/login.php";
    final response = await http.post(Uri.parse(url),
        body: {'nik': user.nik, 'password_user': user.password});
    var jsonresponse = jsonDecode(response.body);

    if (jsonresponse["data"]["id"] != null) {
      // var data = jsonresponse["data"]["id"].toString();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user_id', jsonresponse["data"]["id"].toString());

      if (jsonresponse['data']['jabatan'] == "admin") {
        Navigator.pushNamed(context, 'showUser');
      } else if (jsonresponse['data']['jabatan'] == "driver") {
        Navigator.pushNamed(context, 'InDelivery');
      } else {
        Navigator.pushNamed(context, 'navbar_Karyawan');
      }
      final snackBar = SnackBar(
        content: Text('Login Berhasil !!'),
        duration: Duration(seconds: 3), // Optional: Set the duration
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacementNamed(context, 'dashboard');
    }

    // if (jsonresponse["error"].toString() == "false") {
    //   // Save the user ID to SharedPreferences
    //   // Navigator.pushReplacementNamed(context, 'dashboard');
    // } else {
    //   final snackBar = SnackBar(
    //     content: Text('Login Gagal !!'),
    //     duration: Duration(seconds: 3), // Optional: Set the duration
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   // Navigator.pushReplacementNamed(context, 'dashboard');
    // }
  }

  Future<void> Logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    final snackBar = SnackBar(
      content: Text('Logout Berhasil !!'),
      duration: Duration(seconds: 3), // Optional: Set the duration
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    final url = "http://192.168.1.244/api-pengaduan/logout.php";
    final response = await http
        .post(Uri.parse(url), body: {"user_id": decodedToken["user_id"]});
    print(decodedToken["user_id"]);
    Navigator.pushReplacementNamed(context, "login");
    // print(token);
  }
}
