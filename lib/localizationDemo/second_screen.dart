import 'package:flutter/material.dart';
import './providers/language.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentLanguage = Provider.of<LanguageModel>(context).value.toString();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          iconSize: 20,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        leadingWidth: 30,
        title: Text("Switch Language", style: TextStyle(fontSize: 16),),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Provider.of<LanguageModel>(context, listen: false).switchLanguage("en");
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("en", style: TextStyle(fontSize: 22, color: "en" == currentLanguage? Colors.pinkAccent : Colors.black87)),
                ),
              ),
              InkWell(
                onTap: (){
                  Provider.of<LanguageModel>(context, listen: false).switchLanguage("zh");
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("简体", style: TextStyle(fontSize: 22, color: "zh" == currentLanguage? Colors.pinkAccent : Colors.black87)),
                ),
              ),
              InkWell(
                onTap: (){
                  Provider.of<LanguageModel>(context, listen: false).switchLanguage("zh_HK");
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("繁体", style: TextStyle(fontSize: 22, color: "zh_HK" == currentLanguage? Colors.pinkAccent : Colors.black87)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}