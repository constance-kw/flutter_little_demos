import 'package:flutter/material.dart';

// 继承 PageRouteBuilder
class CustomRouter extends PageRouteBuilder{
  final Widget widget;

  CustomRouter(this.widget) : super(
    transitionDuration: Duration(seconds: 1),
    // 创建跳转的页面
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2
    ){
      return widget;
    },
    //实现过渡动画
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child
    ){
      // return FadeTransition( // 渐隐渐现的效果Widget,flutter自带
      //   opacity: Tween(
      //     begin: 0.0,
      //     end: 1.0
      //   ).animate(
      //     CurvedAnimation(
      //       parent:animation1,
      //       curve:Curves.fastOutSlowIn //动画曲线，快出慢进
      //     )
      //   ),
      //   child: child,
      // );

      // return ScaleTransition( // 缩放的效果Widget,flutter自带
      //   scale: Tween(
      //     begin: 0.0,
      //     end: 1.0
      //   ).animate(
      //     CurvedAnimation(
      //       parent:animation1,
      //       curve:Curves.fastOutSlowIn //动画曲线，快出慢进
      //     )
      //   ),
      //   child: child,
      // );

      //  旋转+缩放的效果
      // return RotationTransition( // 旋转的效果
      //   turns: Tween(
      //     begin: 0.0,
      //     end: 1.0
      //   ).animate(
      //     CurvedAnimation(
      //       parent:animation1,
      //       curve:Curves.fastOutSlowIn //动画曲线，快出慢进
      //     )
      //   ),
      //   child: ScaleTransition( // 嵌套缩放的效果
      //     scale: Tween(
      //       begin: 0.0,
      //       end: 1.0
      //     ).animate(
      //       CurvedAnimation(
      //         parent:animation1,
      //         curve:Curves.fastOutSlowIn //动画曲线，快出慢进
      //       )
      //     ),
      //     child: child,
      //   ),
      // );

      // 左右滑动路由动画
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0, 0.0), // 从左滑到右， 若想从右滑向左Offset(1.0, 0.0)
          end: Offset(0.0, 0.0)
        )
        .animate(CurvedAnimation(
          parent: animation1,
          curve: Curves.fastOutSlowIn
        )),
        child: child,
      );

    }
  );

}