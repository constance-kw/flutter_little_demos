import 'package:flutter/material.dart';
import './pages/first_screen.dart';

// Root
class RouteTransitionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter BottomNavigationBar",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: FirstScreen() // 主页面
    );
  }
}