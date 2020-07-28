import 'package:flutter/material.dart';
import './pages/search_screen.dart';
import './pages/animated_icon_screen.dart';

class SearchBarDemo extends StatelessWidget {
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
        title: Text("HOME"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {
              // 显示搜索页
              showSearch(context: context, delegate: SearchBarViewDelegate())
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          height: 150,
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.navigate_next, size: 36.0, color: Colors.pinkAccent,), 
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return AnimatedIconScreen();
                  }))
                }
              ),
              Text("Go to Animated Icon Screen", style: TextStyle(color: Colors.pinkAccent))
            ],
          ),
        )
      ),
    );
  }
}


