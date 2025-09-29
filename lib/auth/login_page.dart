import 'package:flutter/material.dart';
import 'package:latihan_kuis/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSucces = true;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/flutter.png', height: 100),
                  const SizedBox(height: 24),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Login untuk mengakses lebih banyak fitur',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  _usernameField(),
                  _passwordField(),
                  const SizedBox(height: 5),
                  _loginButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: const InputDecoration(
          hintText: 'Username',
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: const Color.fromARGB(241, 255, 229, 82),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: const Color.fromARGB(241, 255, 229, 82),
            ),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: const InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: const Color.fromARGB(241, 255, 229, 82),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: const Color.fromARGB(241, 255, 229, 82),
            ),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(241, 255, 229, 82),
        ),
        onPressed: () {
          String text = ""; //nyimpen kata buat login gagal or berhasil
          if (username == "fulan" && password == "fulan") {
            setState(() {
              //minta flutter buat reload dan build ulang halamannya
              text = "Login Sukses";
              isLoginSucces = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage(username: username);
                },
              ),
            );
            //pake pushreplacement biar user kalo udah login ga bisa back lagi
            //pake push bisa pake back jadi nanti ada tombol back
          } else {
            setState(() {
              text = "Login Gagal";
              isLoginSucces = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text("Login", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
