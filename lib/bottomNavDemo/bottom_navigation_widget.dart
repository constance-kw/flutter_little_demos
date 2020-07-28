import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

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
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirPlayScreen());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _bottomNavigationColor),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor
            ),
            title: Text(
              'Email',
              style: TextStyle(color: _bottomNavigationColor),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomNavigationColor
            ),
            title: Text(
              'Pages',
              style: TextStyle(color: _bottomNavigationColor),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _bottomNavigationColor
            ),
            title: Text(
              'AirPlay',
              style: TextStyle(color: _bottomNavigationColor),
            )
          )
        ],
        currentIndex: _currentIndex, //选中哪个
        onTap: (int index){ //监听选中
          setState(() {
            _currentIndex = index;
          });
        },
        // type:BottomNavigationBarType.fixed // 不加fixed的话，没有currentIndex+非active的tab是不显示title的
      ),
    );
  }
}