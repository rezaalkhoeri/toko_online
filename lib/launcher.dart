import 'package:flutter/material.dart';
import 'package:toko_online/navbar.dart';
import 'dart:async';

class Launcher extends StatefulWidget {
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Navbar();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73, 176, 255),
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 300.0,
          height: 150.0,
        ),
      ),
    );
  }
}
