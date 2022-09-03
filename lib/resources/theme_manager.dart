import 'package:flutter/material.dart';
import 'package:mini_store_app/resources/color_manager.dart';
import 'package:mini_store_app/resources/font_manager.dart';
import 'package:mini_store_app/resources/values_manager.dart';

class ThemeManager {
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.lightScaffoldColor,
      primaryColor: ColorManager.lightCardColor,
      backgroundColor: ColorManager.lightBackgroundColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: ColorManager.lightIconsColor,
        ),
        backgroundColor: ColorManager.lightScaffoldColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorManager.lightTextColor,
          fontSize: FontSize.s22,
          fontWeight: FontWeightManager.bold,
        ),
        elevation: AppSize.s0,
      ),
      iconTheme: IconThemeData(
        color: ColorManager.lightIconsColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.blackColor,
        selectionColor: ColorManager.blueColor,
        // selectionHandleColor: Colors.blue,
      ),
      // textTheme: TextTheme()
      // textTheme: Theme.of(context).textTheme.apply(
      //       bodyColor: Colors.black,
      //       displayColor: Colors.black,
      //     ),
      cardColor: ColorManager.lightCardColor,
      // status bar
      brightness: Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: ColorManager.lightIconsColor,
            brightness: Brightness.light,
          ),
    );
  }
}
