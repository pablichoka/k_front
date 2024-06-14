import 'package:flutter/material.dart';
import 'package:k_front/pages/desktop/index.dart';

import '../controller/impl/api_user_controller_impl.dart';
import '../controller/api_user_controller.dart';
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
    // loadWelcomeText();
  }

  ApiUserController apiUser = ApiUserControllerImpl();

  // Future<void> loadWelcomeText() async {
  //   try {
  //     var response = await apiUser.getNoAuth('/index');
  //     setState(() {
  //       welcomeText = response['message'];
  //     });
  //   } catch (e) {
  //     setState(() {
  //       welcomeText = 'Connection failed';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 600
        ? desktopIndex(context)
        : mobileIndex(context);
  }
}
