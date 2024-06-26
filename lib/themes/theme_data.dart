import 'package:flutter/material.dart';
import 'package:material_theme_builder/material_theme_builder.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';

const lightGreen = Color.fromARGB(255, 164, 194, 165);
const dark = Color.fromARGB(255, 74, 74, 72);
const white = Color.fromARGB(255, 241, 242, 235);
const hoverColor = Color.fromARGB(255, 216, 218, 211);
const errorOnLight = Color.fromARGB(200, 145, 23, 31);
const errorOnDark = Color.fromARGB(255, 145, 23, 31);
const mintGreen = Color.fromARGB(255, 199, 234, 228);
const darkGreen = Color.fromARGB(255, 0, 128, 0);

ThemeData buildKCalControlLightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: MaterialThemeBuilder(
            brightness: Brightness.light,
            primary: lightGreen,
            secondary: dark,
            tertiary: hoverColor,
            error: errorOnLight,
            neutral: white)
        .toScheme(),
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
            primary: lightGreen,
            secondary: mintGreen,
            tertiary: hoverColor,
            error: errorOnDark,
            neutral: dark)
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
      backgroundColor: darkGreen,
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