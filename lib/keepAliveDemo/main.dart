import 'package:flutter/material.dart';
import './pages/each_screen.dart';

class KeepAliveDemo extends StatelessWidget {
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

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

/*
  with是dart的关键字，意思是混入的意思，
  就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
  避免多重继承导致的问题。
  SingleTickerProviderStateMixin 主要是我们初始化TabController时，
  需要用到vsync ，垂直属性，然后传递this
*/
class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  //重写被释放的方法，只释放TabController
  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); //销毁
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keep Alive Demo"),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.directions_bike),),
            Tab(icon: Icon(Icons.directions_boat),),
            Tab(icon: Icon(Icons.directions_bus),)
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          EachPage(),
          EachPage(),
          EachPage()
        ],
      )
    );
  }
}

