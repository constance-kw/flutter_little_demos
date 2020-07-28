import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"), 
        backgroundColor: Colors.pinkAccent,
        automaticallyImplyLeading: false, // Don't show the leading button
        elevation: 0.0,
      ),
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () => {
            Navigator.pop(context)
          },
        ),
      )
    );
  }
}