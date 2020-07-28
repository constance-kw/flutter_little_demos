import 'package:flutter/material.dart';

class ChildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Text("Slide right to goBack", style: Theme.of(context).textTheme.display1,),
      ),
    );
  }
}