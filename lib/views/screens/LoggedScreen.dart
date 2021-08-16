import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lolmeet/views/components/SimpleButton.dart';
import 'package:lolmeet/views/screens/LoginScreen.dart';

class LoggedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginButton(text: 'Sair', function: logout),
    );
  }

  logout() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.to(LoginScreen()));
  }
}
