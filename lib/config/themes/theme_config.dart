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
        bodyText2: TextStyle(color: APP_PRIMARY_COLOR_HEX),
        headline1: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
        headline2: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
        headline3: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
        headline4: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
        headline5: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
        headline6: TextStyle(color: APP_PRIMARY_COLOR_HEX, fontSize: 30),
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(15.0),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: APP_PRIMARY_COLOR_HEX, width: 0.0)),
          border: const OutlineInputBorder(
              borderSide:
                  const BorderSide(color: APP_PRIMARY_COLOR_HEX, width: 0.0)),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  const BorderSide(color: APP_PRIMARY_COLOR_HEX, width: 0.0))),
    );
  }
}
