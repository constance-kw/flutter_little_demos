import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //多语言
import 'package:provider/provider.dart';
// import './app_localizations.dart';
import '../generated/l10n.dart';
import './providers/language.dart';
import './second_screen.dart';

class LocalizationIntlDemo extends StatelessWidget {
  bool isFirstEnter = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      //多语言
      // // 在此处列出应用程序支持的所有语言环境
      // supportedLocales: [
      //   // (截至2017年10月，国际化代理的类支持约15种语言)
      //   // https://github.com/flutter/flutter/tree/master/packages/flutter_localizations/lib/src/l10n
      //   // Local(languageCode, countryCode) languageCode不能乱写，一定是在支持范围内的code; 
      //   // countryCode 可以不填，若填的话，也不能乱写
      //   // const Locale('en', ''), // 有效
      //   const Locale('en', ''),
      //   const Locale('cn', ''), // cn无效,会报错
      //   const Locale('zh', 'HK'),
      //   const Locale('zh', ''),
      // ],
      supportedLocales: S.delegate.supportedLocales,
      // 这些 delegates 确保正确语言的本地化数据已加载
      localizationsDelegates: [
        //从JSON文件加载翻译的类
        // AppLocalizations.delegate,
        S.delegate,
        //材质小部件的基本文本的内置本地化
        GlobalMaterialLocalizations.delegate,
        // ios样式的翻译，可有可无，视乎你用啥
        GlobalCupertinoLocalizations.delegate,
        //文字方向LTR / RTL的内置本地化
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if(isFirstEnter){
          print('deviceLocale: $deviceLocale');
          isFirstEnter = false;
          Provider.of<LanguageModel>(context).setDeviceLang(deviceLocale.toString());
        }
      },
      // 返回将由应用程序使用的语言环境
      // 逻辑要写好，现在是languageCode+countryCode都要配合才会返回，非必要感觉不要加countryCode
      // localeResolutionCallback: (locale, supportedLocales) {
      //   // 检查当前设备的语言环境是否受支持
      //   print("######${locale}####");
      //   print("####${supportedLocales}###");
      //   for (var supportedLocale in supportedLocales) {
      //     print("====${supportedLocale.languageCode} ${locale.languageCode}===");
      //     print("----${supportedLocale.countryCode} ${locale.countryCode}---");
      //     if (supportedLocale.languageCode == locale.languageCode &&
      //         supportedLocale.countryCode == locale.countryCode) {
      //       print("++++++${supportedLocale}+++++");
      //       return Locale(locale.languageCode, locale.countryCode); //supportedLocale;
      //     }
      //   }
      //   //如果不支持设备的语言环境，请使用第一个
      //   //从列表中获取（本例中为英文）。
      //   return supportedLocales.first;
      // },
      locale: Provider.of<LanguageModel>(context).value,
      home: Main(), // 主页面
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                S.of(context).welcome("Cherry", "Mo"),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                S.of(context).hello,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                S.of(context).world,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                S.of(context).remainingEmailsMessage(0),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                S.of(context).remainingEmailsMessage(1),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                S.of(context).remainingEmailsMessage(2),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                S.of(context).pageHomeWelcomeRole("admin"),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                S.of(context).pageHomeWelcomeRole("manager"),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                S.of(context).pageHomeWelcomeRole(""),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'This will not be translated.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                child: Text("Switch Language"),
                onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return SecondScreen();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}