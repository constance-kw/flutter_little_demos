import 'package:flutter/material.dart';

class ExpansionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: MainScreen() // 主页面
    );
  }
}

// 单个
class MainSigleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME")
      ),
      body: Column(
        children: [
          Container(
            child: ExpansionTile(
              title: Text("Expansion Tile"), // 闭合时显示的标题，这个部分经常使用Text Widget
              leading: Icon(Icons.ac_unit), // 标题左侧图标，多是用来修饰，让界面显得美观
              backgroundColor: Colors.black12, // 展开时的背景颜色，当然也是有过度动画的，效果非常好
              children: [ // 展开时，要显示的内容
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text("Title"),
                      Text("SubTitle")
                    ],
                  ),
                )
              ],
              initiallyExpanded: true, // 初始状态是否展开，为true时，是展开，默认为false，是不展开。
              // onExpansionChanged: (bool expanding){} // 监听展开合上
            ),
          ),
          Container(
            color: Colors.orangeAccent, // 想要视觉上改变ExpansionTile的默认背景颜色，只能在外面加了
            child: Theme(
              data: ThemeData(
                primarySwatch: Colors.orange // 最快捷的统一改变title，leading，trailing的颜色的方式就是改变主题颜色
              ),
              child: ExpansionTile(
                title: Text("Expansion Tile"), // 闭合时显示的标题，这个部分经常使用Text Widget
                leading: Icon(Icons.ac_unit), // 标题左侧图标，多是用来修饰，让界面显得美观
                //trailing ： 右侧的箭头，你可以自行替换但是我觉的很少替换，因为谷歌已经表现的很完美了。
                backgroundColor: Colors.pink, // 展开时的背景颜色，当然也是有过度动画的，效果非常好
                children: [ // 展开时，要显示的内容
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Text("Title"),
                        Text("SubTitle")
                      ],
                    ),
                  )
                ],
                initiallyExpanded: true, // 初始状态是否展开，为true时，是展开，默认为false，是不展开。
              ),
            )
          )
        ],
      )
    );
  }
}


//List
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentPanelIndex = -1;
  List<int> mList; // 组成一个int类型数组，用来控制索引
  List<ExpandStateBean> expandStateList; // 开展开的状态列表， ExpandStateBean是自定义的类

  //构造方法，调用这个类的时候自动执行
  _MainScreenState(){
    mList = new List();
    expandStateList = new List();
    // 为两个list进行初始化
    for(int i=0;i<10;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }

  // 修改展开与闭合的内部方法
  _setCurrentIndex(int index, bool isExpand){
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item){
        if(item.index==index){
          //取反，经典取反方法
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME")
      ),
      // 加入可滚动组件
      body: SingleChildScrollView(
        child: ExpansionPanelList( //只展开一个使用ExpansionPanelList.radio，支持多个展开使用ExpansionPanelList
          //交互回掉属性，里边是个匿名函数
          expansionCallback: (index,bol){
            //调用内部方法
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){
            return new ExpansionPanel( //只展开一个使用ExpansionPanelRadio，支持多个展开使用ExpansionPanel
              canTapOnHeader: true, // 点击头部也支持展开合上
              headerBuilder: (context, isExpanded){
                return ListTile(
                  title: Row(children: [
                    Padding(padding: const EdgeInsets.only(right: 10), child: Icon(Icons.ac_unit, color: Colors.pink,),),
                    Text("This is No.${index}", style: TextStyle(color: Colors.pink),)
                  ],)
                );
              },
              body:Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Text("Title"),
                    Text("SubTitle")
                  ],
                ),
              ),
              isExpanded: expandStateList[index].isOpen // 当使用ExpansionPanel时用
              // value: expandStateList[index].isOpen // 当使用ExpansionPanelRadio时用
            );
          }).toList(),
        ),
      ),
    );
  }
}

//自定义扩展状态类
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}
