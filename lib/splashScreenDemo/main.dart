import 'package:flutter/material.dart';
import './pages/splash_screen.dart';
import './pages/home_screen.dart';

class SplashScreenDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: SplashScreen() // 欢迎页
    );
  }
}

