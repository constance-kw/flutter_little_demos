import 'package:flutter/material.dart';
import 'package:flutter_app/bottomNavDemo/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

     /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()), 
          (route) => false);
      }
    });

    // 播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FadeTransition(
          opacity: _animation,
          child: Image.network(
            "https://mcq.mozhijie.top/bak/images/lisa.jpeg",
            fit:BoxFit.cover  // 充满父容器
          ),
        ),
      )
      // body: FadeTransition(
      //   opacity: _animation,
      //   child: Image.network(
      //     "https://mcq.mozhijie.top/bak/images/lisa.jpeg",
      //     fit:BoxFit.cover  // 充满父容器
      //   ),
      // ),
    );
  }
}