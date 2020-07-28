import 'package:flutter/material.dart';
import './bottom_navigation_widget.dart';

// Root
class BottomNavDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter BottomNavigationBar",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: BottomNavigationWidget() // 主页面
    );
  }
}