import 'package:flutter/material.dart';


class AnimatedIconScreen extends StatefulWidget {
  @override
  _AnimatedIconScreenState createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  List<AnimatedIcon> _icons;
  List<String> _names;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this)
      ..drive(Tween(begin: 0, end: 1))
      ..duration = Duration(milliseconds: 500);

    _names = [
      'play_pause',
      'add_event',
      'arrow_menu',
      'close_menu',
      'ellipsis_search',
      'event_add',
      'home_menu',
      'list_view',
      'menu_arrow',
      'menu_close',
      'menu_home',
      'pause_play',
      'search_ellipsis',
      'view_list',
    ];

    _icons = [
      AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: controller,
        size: 35,
        semanticLabel: "play_pause",
      ),
      AnimatedIcon(
        icon: AnimatedIcons.add_event,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.close_menu,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.ellipsis_search,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.event_add,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.home_menu,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.list_view,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.menu_home,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.pause_play,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.search_ellipsis,
        progress: controller,
        size: 35,
      ),
      AnimatedIcon(
        icon: AnimatedIcons.view_list,
        progress: controller,
        size: 35,
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Icon"),
      ),
      body: _buildGridView(),
    );
  }

  Widget _buildGridView(){
    return GridView.builder(
      itemCount: _icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ), 
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            if(controller.status == AnimationStatus.completed){
              controller.reverse();
            }else{
              controller.forward();
            }
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _icons[index],
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(_names[index]),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}