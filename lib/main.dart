import 'package:flutter/material.dart';
import 'components/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '𝚝𝚑𝚎 𝚛𝚎𝚊𝚍𝚎𝚛',
      theme: ThemeData(
        primaryColor: Color(0xFF21272C),
        scaffoldBackgroundColor: Color(0xFF21272C),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF21272C),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 3,
          shadowColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.grey.shade800),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
