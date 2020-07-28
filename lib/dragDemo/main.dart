import 'package:flutter/material.dart';

class DragDemo extends StatelessWidget {
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
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME")
      ),
      body: Stack( // 在Stack里
        children: [
          DraggableWidget(
            offset: Offset(80.0, 80.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: Offset(180.0, 80.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color){
                _draggableColor = color;
              }, //在这里放手时触发，接受dragable传过来的参数
              builder: (context, candidateData, rejectedData) { //DragTarget Widget
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _draggableColor,
                );
              }
            ),
          )
        ],
      )
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;
  const DraggableWidget({Key key, this.offset, this.widgetColor}):super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor, // 传给DrageTarget
        child: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor.withOpacity(0.5)
        ), //拖动时的widget
        onDraggableCanceled: (Velocity velocity, Offset offset){
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
