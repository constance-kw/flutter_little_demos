import 'package:flutter/material.dart';
import '../asset.dart';

class SearchBarViewDelegate extends SearchDelegate<String>{

  // 一定要重写buildActions，代表右边的action
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "", //query是输入框的值
      )
    ];
  }

  // 一定要重写buildLeading，代表左边action
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, //flutter自带带图标过渡动画
        progress: transitionAnimation
      ),
      onPressed: () => close(context, null)
    );
  }

  // 一定要重写buildSuggestions，会在输入框聚焦和输入过程中显示推荐关键词
  @override
  Widget buildSuggestions(BuildContext context) {
    final resultList = query.isEmpty 
        ? suggestList 
        : sourceList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
            text: resultList[index].substring(0, query.length),
            style: TextStyle(color: Colors.pink),
            children: [
              TextSpan(
                text: resultList[index].substring(query.length),
                style: TextStyle(color: Colors.black87),
              )
            ]
          ),
        ),
        onTap: () {
          query = resultList[index].toString(); //设置输入框的值为query，方便点击“Search”后，可以在Search里拿到用户点击了哪个关键词
          showResults(context); // 用户点击关键词后，触发“Search”
        },
      ),
    );
  }

  // 一定要重写buildResults，会在用户点击键盘的“Search”时显示
  @override
  Widget buildResults(BuildContext context) {
    List<String> result = List();

    // 模拟搜索过程
    // 如果有关键词
    if(query.isNotEmpty){
      for(int i = 0; i < 20; i++){
        result.add("${query}_${i}");
      }
    }
    
    return result.length != 0 
        ? ListView.builder(
            itemCount: result.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(result[index]),
            )
          )
        : Center(
            child: Text("No Result", style: Theme.of(context).textTheme.display1,),
          );
  }
}