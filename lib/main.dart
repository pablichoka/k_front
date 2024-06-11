import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:k_front/services/theme_provider.dart';
import 'package:provider/provider.dart';

import 'services/app_controller.dart';

const storage = FlutterSecureStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: const KCalFront(),
      ),
  );}
