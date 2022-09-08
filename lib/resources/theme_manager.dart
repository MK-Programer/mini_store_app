import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class ThemeManager {
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.lightScaffoldColor,
      primaryColor: ColorManager.lightCardColor,
      backgroundColor: ColorManager.lightBackgroundColor,
      appBarTheme: const AppBarTheme(
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
      iconTheme: const IconThemeData(
        color: ColorManager.lightIconsColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorManager.blackColor,
        selectionColor: ColorManager.blueColor,
      ),
      cardColor: ColorManager.lightCardColor,
      // status bar
      brightness: Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: ColorManager.lightIconsColor,
            brightness: Brightness.light,
          ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          color: ColorManager.blackColor,
          fontWeight: FontWeightManager.normal,
          fontSize: FontSize.s18,
        ),
        displayMedium: TextStyle(
          color: ColorManager.lightTextColor,
          fontWeight: FontWeightManager.bold,
          fontSize: FontSize.s18,
        ),
        labelMedium: TextStyle(
          color: ColorManager.cyan,
          fontWeight: FontWeightManager.normal,
          fontSize: FontSize.s16,
        ),
        titleSmall: TextStyle(
          color: ColorManager.white,
          fontWeight: FontWeightManager.normal,
          fontSize: FontSize.s14,
        ),
        titleMedium: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: ColorManager.blackColor,
          fontWeight: FontWeightManager.semiBold,
          fontSize: FontSize.s18,
        ),
        titleLarge: TextStyle(
          color: ColorManager.blackColor,
          fontWeight: FontWeightManager.bold,
          fontSize: FontSize.s24,
        ),
        headlineMedium: TextStyle(
          color: ColorManager.blackColor,
          fontWeight: FontWeightManager.medium,
          fontSize: FontSize.s18,
        ),
        headlineLarge: TextStyle(
          color: ColorManager.blackColor,
          fontSize: FontSize.s20,
          fontWeight: FontWeightManager.medium,
        ),
        bodySmall: TextStyle(
          color: ColorManager.white,
          fontWeight: FontWeightManager.bold,
          fontSize: FontSize.s14,
        ),
      ),
    );
  }
}
