import 'package:flutter/material.dart';
import 'pages/each_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  
  final Color _bottomNavigationColor = Colors.pink;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(EachScreen(title: "Home"))
      ..add(EachScreen(title: "AirPlay"))
      ..add(EachScreen(title: "Email"))
      ..add(EachScreen(title: "Pages"));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
            return EachScreen(title: 'New Page');
          }));
        },
        tooltip: "This is a Button",
        child: Icon(
          Icons.add,
          color: Colors.white
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: _currentIndex == 0 ? Colors.pink : Colors.black38,
              onPressed: (){
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              color: _currentIndex == 1 ? Colors.pink : Colors.black38,
              onPressed: (){
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            Container( // 增加一个容器，为了给floatingActionButton让出位置
              width: 30,
              height: 0,
            ),
            IconButton(
              icon: Icon(Icons.email),
              color: _currentIndex == 2 ? Colors.pink : Colors.black38,
              onPressed: (){
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.pages),
              color: _currentIndex == 3 ? Colors.pink : Colors.black38,
              onPressed: (){
                setState(() {
                  _currentIndex = 3;
                });
              },
            )
          ],
        ),
      )
    );
  }
}