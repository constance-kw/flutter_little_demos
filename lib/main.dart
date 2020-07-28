import 'package:flutter/material.dart';
import './bottomNavDemo/main.dart';
import './bottomAppBarDemo/main.dart';
import './routeTransitionDemo/main.dart';
import './frostedGlassDemo/main.dart';
import './keepAliveDemo/main.dart';
import './searchBarDemo/main.dart';
import './futureBuilderDemo/main.dart';
import './wrapDemo/main.dart';
import './expansionDemo/main.dart';
import './clipDemo/main.dart';
import './splashScreenDemo/main.dart';
import './cupertinoPageDemo/main.dart';
import './dragDemo/main.dart';

import 'package:provider/provider.dart';
// import './localizationDemo/main.dart';
// import './localizationDemo/providers/language.dart';
import './localizationIntlDemo/main.dart';
import './localizationIntlDemo/providers/language.dart';

void main() {
  // runApp(BottomNavDemo());
  // runApp(BottomAppBarDemo());
  // runApp(RouteTransitionDemo());
  // runApp(FrostedGlassDemo());
  // runApp(KeepAliveDemo());
  // runApp(SearchBarDemo());
  // runApp(FutureBuilderDemo());
  // runApp(WrapDemo());
  // runApp(ExpansionDemo());
  // runApp(BezierDemo());
  // runApp(SplashScreenDemo());
  // runApp(CupertinoPageDemo());
  // runApp(DragDemo());

  // WidgetsFlutterBinding.ensureInitialized(); //因为LanguageModel的构造函数里运行了异步函数，不加会报错
  // runApp(ChangeNotifierProvider.value( // 因为LocalizationDemo里等配置需要Provider读取value，所以要在这里包裹
  //       value: LanguageModel(),
  //       child: LocalizationDemo(),
  //     ),);

  WidgetsFlutterBinding.ensureInitialized(); //因为LanguageModel的构造函数里运行了异步函数，不加会报错
  runApp(ChangeNotifierProvider.value( // 因为LocalizationDemo里等配置需要Provider读取value，所以要在这里包裹
        value: LanguageModel(),
        child: LocalizationIntlDemo(),
      ),);
}
