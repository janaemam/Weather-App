import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/theme/theme.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void switchTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }

}