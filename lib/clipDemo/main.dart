import 'package:flutter/material.dart';
import './pages/bezier.dart';
import './pages/bezier_wave.dart';

class BezierDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: Main() // 主页面
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME")
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                color: Colors.pinkAccent,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return Bezier();
                  }));
                },
                child: Text("贝塞尔曲线", style: TextStyle(color: Colors.white)),
              ),
              FlatButton(
                color: Colors.pinkAccent,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return BezierWave();
                  }));
                },
                child: Text("波浪形贝塞尔曲线", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
      ),
    );
  }
}


