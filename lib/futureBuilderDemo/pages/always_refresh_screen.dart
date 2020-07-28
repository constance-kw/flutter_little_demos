import 'package:flutter/material.dart';

class AlwaysRefreshScreen extends StatefulWidget {
  @override
  _AlwaysRefreshScreenState createState() => _AlwaysRefreshScreenState();
}

class _AlwaysRefreshScreenState extends State<AlwaysRefreshScreen> {

  bool _switchValue;

  @override
  void initState() {
    super.initState();
    this._switchValue = false;
  }

  _fetchData() async {
    print("====load data=====");
    await Future.delayed(Duration(seconds: 2));
    return 'REMOTE DATA';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Always Refresh"),
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
              future: this._fetchData(),
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


