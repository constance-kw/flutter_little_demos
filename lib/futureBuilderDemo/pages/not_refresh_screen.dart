import 'package:flutter/material.dart';
import 'package:async/async.dart';

class NotRefreshScreen extends StatefulWidget {
  @override
  _NotRefreshScreenState createState() => _NotRefreshScreenState();
}

class _NotRefreshScreenState extends State<NotRefreshScreen> {

  bool _switchValue;
  bool isNeedRefresh = false;
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
    this._switchValue = false;
  }

  // 解决方案:
  _fetchData1() async {
    // future的value永远返回同一个实例就好
    return this._memoizer.runOnce(() async {
      print("====load data=====");
      await Future.delayed(Duration(seconds: 2));
      return 'REMOTE DATA';
    });
  }

  // 解决方案+自定义是否需要refresh
  _fetchData(isRefresh) async {
    if(isRefresh){
      print("====refresh load data=====");
      await Future.delayed(Duration(seconds: 2));
      return 'REMOTE DATA';
    }
    // future的value永远返回同一个实例就好
    return this._memoizer.runOnce(() async {
      print("====load data=====");
      await Future.delayed(Duration(seconds: 2));
      return 'REMOTE DATA';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Always Refresh2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: this._switchValue,
            onChanged: (newValue) {
              setState(() {
                this._switchValue = newValue;
              });
            },
          ),
          FutureBuilder(
            future: this._fetchData(isNeedRefresh), // 这个永远返回同一个实例就好
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator()
                  );
                default:
                  return Center(
                    child: Text(snapshot.data)
                  );
              }
            }
          ),
        ],
      ),
    );
  }
}


