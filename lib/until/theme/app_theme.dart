import 'dart:ffi';

import 'package:flutter/material.dart';

class YTAppTheme {
  // 字体大小
  static const double smallFontSize = 16;
  static const double fontSize = 18;
  static const double subTitleSize = 20;

  static const String fontFamily = "PingFang SC";
  static const Color textColor = Color(0xFF333333);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme (
      bodyText1: TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: textColor),
      // 正文文字
      bodyText2: TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: textColor),
      subtitle1: TextStyle(fontSize: subTitleSize, fontFamily: fontFamily, color: textColor),
      headline1: TextStyle()
    )
  );
  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.brown,
      canvasColor: Color.fromRGBO(255, 254, 222, 1),
      textTheme: TextTheme (
        bodyText1: TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: textColor),
        bodyText2: TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: textColor),
        subtitle1: TextStyle(fontSize: subTitleSize, fontFamily: fontFamily, color: textColor),
        headline1: TextStyle()
      )
  );
}