import 'package:flutter/material.dart';

class EachScreen extends StatelessWidget {

  final String title; 

  const EachScreen({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.title}"),),
      body: Center(child: Text("${this.title}"),)
    );
  }
}