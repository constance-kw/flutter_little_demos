import 'package:flutter/material.dart';
import './pages/always_refresh_screen.dart';
import './pages/not_refresh_screen.dart';

class FutureBuilderDemo extends StatelessWidget {
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
                    return AlwaysRefreshScreen();
                  }));
                },
                child: Text("Always Refresh", style: TextStyle(color: Colors.white)),
              ),
              FlatButton(
                color: Colors.pinkAccent,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return NotRefreshScreen();
                  }));
                },
                child: Text("Not Always Refresh", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
      ),
    );
  }
}


