import 'package:flutter/material.dart';
import 'package:k_front/pages/desktop/index.dart';

import '../services/api_service.dart' as api;
import 'mobile/index.dart';

class WebIndex extends StatefulWidget {
  const WebIndex({super.key});

  @override
  State<WebIndex> createState() => _WebIndexState();
}

class _WebIndexState extends State<WebIndex> {
  final String title = "kCal Control";
  String welcomeText = 'Loading...';

  @override
  void initState() {
    super.initState();
    loadWelcomeText();
  }

  Future<void> loadWelcomeText() async {
    var apiService = api.ApiService.instance;
    try {
      var response = await apiService.getNoAuth('/index');
      setState(() {
        welcomeText = response['message'];
      });
    } catch (e) {
      setState(() {
        welcomeText = 'Connection failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 600
        ? desktopIndex(context)
        : mobileIndex(context);
  }
}
