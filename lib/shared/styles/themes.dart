import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: YuktColors.yuktMatBlack,
  primarySwatch: YuktColors.yuktMatRed,
  scaffoldBackgroundColor: YuktColors.yuktBlack,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: YuktColors.yuktRed,
    ),
    titleTextStyle: TextStyle(
      color: YuktColors.yuktWhite,
    ),
    iconTheme: IconThemeData(
      color: YuktColors.yuktRed,
    ),
    backgroundColor: YuktColors.yuktBlack,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: YuktColors.yuktBlack,
      statusBarBrightness: Brightness.light,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: YuktColors.yuktRed,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: YuktColors.yuktRed,
    unselectedItemColor: Colors.grey,
    elevation: 30.0,
    backgroundColor: YuktColors.yuktBlack,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.w600,
      color: YuktColors.yuktWhite,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  primaryColor: YuktColors.yuktMatWhite,
  primarySwatch: YuktColors.yuktMatRed,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: YuktColors.yuktRed,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: YuktColors.yuktRed,
    unselectedItemColor: Colors.grey,
    elevation: 30.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);
