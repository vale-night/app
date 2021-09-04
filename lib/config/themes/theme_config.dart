import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/utils/helpers/create_material_color.dart';

class ThemeConfig {
  ThemeData get materialTheme {
    return ThemeData(
        primaryColor: APP_PRIMARY_COLOR_HEX,
        primarySwatch:
            CreateMaterialColor().createMaterialColor(APP_PRIMARY_COLOR_HEX),
        textTheme: TextTheme(
            headline1: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
            headline2: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
            headline3: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
            headline4: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
            headline5: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
            headline6: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30)));
  }
}
