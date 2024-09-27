import 'package:flutter/material.dart';
import 'package:material_theme_builder/material_theme_builder.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';

//TODO: create color schemes manually for light and dark mode

const primaryLightColor = Color(0xFF386641);
const secondaryLightColor = Color(0xfff2e8cf);
const tertiaryLightColor = Color(0xff6a994e);
const hoverLightColor = Color(0xffa7c957);
const errorLight = Color(0xff800e13);
const primaryDarkColor = Color(0xff6a994e);
const secondaryDarkColor = Color(0xfff2e8cf);
const tertiaryDarkColor = Color(0xffa4c3b2);
const hoverDarkColor = Color(0xff6eceb2);
const errorOnDark = Color(0xffbc4749);

ThemeData buildKCalControlLightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryLightColor,
      onPrimary: Colors.white, // Adjust as needed
      secondary: secondaryLightColor,
      onSecondary: Colors.black, // Adjust as needed
      error: errorLight,
      onError: errorLight, // Adjust as needed
      surface: secondaryLightColor,
      onSurface: Colors.black, // Adjust as needed
      tertiary: tertiaryLightColor,
      onTertiary: Colors.black, //
      shadow: hoverLightColor,
    ),
    textTheme: buildKCalControlTextTheme(lightTheme.textTheme),
  );
}

ThemeData buildKCalControlDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: MaterialThemeBuilder(
            brightness: Brightness.dark,
            primary: primaryLightColor,
            secondary: secondaryDarkColor,
            tertiary: hoverLightColor,
            error: errorOnDark,
            neutral: secondaryDarkColor)
        .toScheme(),
    textTheme: buildKCalControlTextTheme(darkTheme.textTheme),
  );
}

TextTheme buildKCalControlTextTheme(TextTheme base) {
  return base.copyWith(
    headlineSmall: base.headlineSmall?.copyWith(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.w300,
    ),
    headlineMedium: base.headlineMedium
        ?.copyWith(fontFamily: 'ProductSans', fontWeight: FontWeight.w400),
    headlineLarge: base.headlineLarge
        ?.copyWith(fontFamily: 'ProductSans', fontWeight: FontWeight.w500),
  );
}

FloatingActionButton themeSelectorButton(BuildContext context) {
  return FloatingActionButton(
      onPressed: () {
        Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
      },
      backgroundColor: primaryLightColor,
      child: Provider.of<ThemeNotifier>(context).themeMode == ThemeMode.light
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode));
}

var kContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);