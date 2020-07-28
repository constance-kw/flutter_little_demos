import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox( //约束盒子，添加额外的限制条件到 child上
            constraints: const BoxConstraints.expand(), //限制条件，可扩展的。
            child:Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg', fit: BoxFit.cover,)
          ),
          // 全屏模糊
          // Center(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //     child: Text("123555555", style: TextStyle(color: Colors.deepOrange),),
          //   )
          // )
          //局部模糊1:
          // Center(
          //   child: ClipRRect( //要裁剪，否则还是全局模糊
          //     child: Container(
          //       width: 300,
          //       height: 300,
          //       child: Center(
          //         child: BackdropFilter(
          //           filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //           child: Text("123555555", style: TextStyle(color: Colors.deepOrange),),
          //         )
          //       ),
          //     ),
          //   )
          // ),
          //局部模糊2:
          Center(
            child: ClipRRect( //要裁剪，否则还是全局模糊
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 300,
                  height: 300,
                  child: Center(
                    child: Text("123555555", style: TextStyle(color: Colors.deepOrange),),
                  ),
                ),
              )
            )
          )
        ],
      )
    );
  }
}

// Root
class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter BottomNavigationBar",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: HomePage() // 主页面
    );
  }
}