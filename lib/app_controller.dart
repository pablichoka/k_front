import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_front/routes/pages/common/login_page.dart';
import 'package:k_front/routes/index.dart';
import 'package:k_front/routes/pages/common/signup_page.dart';
import 'package:k_front/themes/theme_data.dart';
import 'package:k_front/themes/theme_provider.dart';
import 'package:k_front/utils/device_checker.dart';
import 'package:provider/provider.dart';

final ThemeData _kCalControlLightTheme = buildKCalControlLightTheme();
final ThemeData _kCalControlDarkTheme = buildKCalControlDarkTheme();

class KCalFront extends StatelessWidget {
  final Map<String, int> countryLengths;

  const KCalFront({Key? key, required this.countryLengths}) : super(key: key);

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
    return Provider<Map<String, int>>(
      create: (_) => countryLengths,
      child: MaterialApp(
        // home: kIsWeb ? const WebIndex() : const WebIndex(),
        theme: _kCalControlLightTheme,
        darkTheme: _kCalControlDarkTheme,
        themeMode: themeNotifier.themeMode,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Index(),
          // 'desktop/login': (context) => const DesktopLoginForm(),
          // 'mobile/login': (context) => const MobileLoginForm(),
          'login': (context) => const LoginPage(),
          'signup': (context) => const SignUpPage(),
        },
      ),
    );
  }
}
