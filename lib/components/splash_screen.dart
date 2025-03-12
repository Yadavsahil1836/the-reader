import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'post_list.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => PostList()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21272C),
      body: Center(
        child: Lottie.asset(
          'assets/Splash_Animation.json',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
          repeat: false, //stop te animation when done playing
        ),
      ),
    );
  }
}
