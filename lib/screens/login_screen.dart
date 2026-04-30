import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();
  final auth = AuthService();

  void entrar(BuildContext context) async {
    await auth.login(email.text, pass.text);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  void google(BuildContext context) async {
    await auth.googleLogin();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: pass, decoration: InputDecoration(labelText: "Password")),
            ElevatedButton(onPressed: () => entrar(context), child: Text("Login")),
            ElevatedButton(onPressed: () => google(context), child: Text("Google")),
          ],
        ),
      ),
    );
  }
}
