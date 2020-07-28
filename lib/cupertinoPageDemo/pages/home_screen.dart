import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; //引入ios样式
import './child_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton(
              color: Colors.pink,
              onPressed: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChildScreen()));
                // 只要使用CupertinoPageRoute打开的子页面，就可以实现右滑返回上一级。
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ChildScreen()));
              },
              child: Text("Next", style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Tooltip(
                message: 'tooltip: xxxxxxxxx',
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                  color: Colors.pink,
                  child: Text("长按显示toolTip", style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}