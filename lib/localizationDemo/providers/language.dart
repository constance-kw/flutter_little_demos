import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageModel with ChangeNotifier {

  Locale _currentLanguage; //即使没有值，一运行就默认是en了，而且getStorageLanguage也设置了，这里不需要再设置了
  Locale get value => _currentLanguage;
  SharedPreferences prefs;

  // 构造函数
  LanguageModel(){
    getStorageLanguage();
  }

  Future<void> getStorageLanguage() async{
    prefs = await SharedPreferences.getInstance(); // 获取储存实例
    String localeCode = prefs.getString("localeCode");
    print("****${localeCode}");
    switchLanguage(localeCode);
  }

  void switchLanguage(String localeCode) {
    List codes = localeCode.split("_");
    String languageCode = codes[0];
    String countryCode = codes.length >= 2 ? codes[1] : "";
    _currentLanguage = Locale(languageCode, countryCode);
    prefs.setString("localeCode", localeCode);

    notifyListeners(); // 通知听众
  }
}