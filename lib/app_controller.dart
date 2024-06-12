import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_front/pages/index.dart';
import 'package:k_front/themes/theme_provider.dart';
import 'package:k_front/themes/theme_data.dart';
import 'package:k_front/utils/device_checker.dart';
import 'package:provider/provider.dart';

final ThemeData _kCalControlLightTheme = buildKCalControlLightTheme();
final ThemeData _kCalControlDarkTheme = buildKCalControlDarkTheme();

class KCalFront extends StatelessWidget {
  const KCalFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (isDesktop(context)) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else if (isTablet(context)) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      home: kIsWeb ? const WebIndex() : const WebIndex(),
      theme: _kCalControlLightTheme,
      darkTheme: _kCalControlDarkTheme,
      themeMode: themeNotifier.themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
