import 'package:flutter/material.dart';
import './pages/home_screen.dart';

class CupertinoPageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: HomeScreen() // 首页
    );
  }
}

