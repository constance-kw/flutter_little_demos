import 'package:flutter/material.dart';
import './second_screen.dart';
import '../custom_router.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"), 
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () => {
            // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            //   return SecondScreen();
            // }))
            Navigator.of(context).push(CustomRouter(SecondScreen()))
          },
        ),
      )
    );
  }
}