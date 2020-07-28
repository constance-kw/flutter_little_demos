import 'package:flutter/material.dart';

class Bezier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("贝塞尔曲线"),
        elevation: 0,
      ),
      body: Column(
        children: [
          ClipPath( //路径裁切控件，对里面的child进行形状裁切，比如五角星
            clipper: BottomClipper(), //路径/形状
            child: Container(
              color: Colors.pink,
              height: 200,
              width: MediaQuery.of(context).size.width
            ),

          )
        ],
      ),
    );
  }
}

// clipper 剪裁，制作各种形状
class BottomClipper extends CustomClipper<Path>{

  // 绘制路径
  @override
  Path getClip(Size size) {
    var path = Path();
    var diff = 50; // 这个是指曲线向下“沉”的高度
    // 确定左上点
    path.lineTo(0, 0);
    // 确定左下点
    path.lineTo(0, size.height - diff); // -50是因为贝塞尔的控制点dy是height
    // 画贝塞尔曲线
    // 1. 控制点的位置
    var controlPoint = Offset(size.width/2, size.height);
    // 2. 结束点的位置
    var endPointer = Offset(size.width, size.height-diff);
    // 3. 做曲线,二次的
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPointer.dx, endPointer.dy);

    // 确定右下点
    path.lineTo(size.width, size.height - diff);
    // 确定右上点
    path.lineTo(size.width, 0);

    // 返回path
    return path;
  }

  // 一定要重写, 一般返回false
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
