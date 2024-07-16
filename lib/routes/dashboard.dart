import 'package:flutter/material.dart';
import 'package:k_front/routes/home_page.dart';
import 'package:k_front/routes/menu_builder.dart';
import 'package:k_front/routes/menu_list.dart';
import 'package:k_front/routes/profile.dart';
import 'package:k_front/widgets/common/dashboard_sidebar.dart';
import 'package:sidebarx/sidebarx.dart';

import '../themes/theme_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  final String title = "kCal Control";

  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  Widget _currentScreen = const HomePage();
  late final SidebarXController _sidebarController;

  void _changeScreen(int index) {
    Widget screen;
    switch (index) {
      case 0:
        screen = const HomePage();
        break;
      case 1:
        screen = const MenuBuilder();
        break;
      case 2:
        screen = const MenuList();
        break;
      case 3:
        screen = const ProfilePage();
        break;
      default:
        throw Exception('Invalid index: $index');
    }

    setState(() {
      _currentScreen = screen;
      _sidebarController.selectIndex(index);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sidebarController = SidebarXController(
        selectedIndex: 0,
        extended: MediaQuery.of(context).size.width > 600 ? true : false
    );
  }

  @override
  Widget build(BuildContext context) {
    // _sidebarController
    //     .setExtended(MediaQuery.of(context).size.width > 600 ? true : false);
    return Scaffold(
      body: Row(children: [
        // dashboardSidebar(
        //     context, _sidebarController, _currentScreen, _changeScreen),
        Expanded(
            child: Center(
          child: _currentScreen,
        )),
      ]),
      floatingActionButton: themeSelectorButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
