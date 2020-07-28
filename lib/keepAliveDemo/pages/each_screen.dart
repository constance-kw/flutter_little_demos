import 'package:flutter/material.dart';

class EachPage extends StatefulWidget {
  @override
  _EachPageState createState() => _EachPageState();
}

/*
  with是dart的关键字，意思是混入的意思，
  就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
  避免多重继承导致的问题。
*/
class _EachPageState extends State<EachPage> with AutomaticKeepAliveClientMixin {

  //重写keepAlive 为ture ，就是可以有记忆功能了。
  @override
  bool get wantKeepAlive => true;

  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一下加1，点一下加1:'),
            Text(
              '$_counter',
              style:Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
      //增加一个悬浮按钮，点击时触犯_incrementCounter方法
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}