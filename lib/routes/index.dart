import 'package:flutter/material.dart';
import 'package:k_front/routes/pages/desktop/index_page.dart';
import 'package:k_front/routes/pages/tablet/index_page.dart';

import '../controller/impl/api_user_controller_impl.dart';
import '../controller/api_user_controller.dart';
import 'pages/mobile/index_page.dart';
import '../utils/device_checker.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
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
    return isDesktop(context)
        ? desktopIndex(context)
        : isTablet(context)
            ? tabletIndex(context)
            : mobileIndex(context);
  }
}
