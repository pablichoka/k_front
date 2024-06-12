import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:k_front/controller/impl/api_auth_controller_impl.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../controller/api_auth_controller.dart';
import '../../themes/desktop/sidebar_theme.dart';
import '../../themes/theme_data.dart';

ApiAuthController apiUser = ApiAuthControllerImpl();

SidebarX dashboardSidebar(
    BuildContext context,
    SidebarXController sidebarController,
    Widget currentScreen,
    void Function(int) changeScreen) {
  return SidebarX(
    showToggleButton: true,
    theme: kIsWeb
        ? desktopCollapsedTheme(context)
        : desktopCollapsedTheme(context),
    extendedTheme:
        kIsWeb ? desktopExtendedTheme(context) : desktopExtendedTheme(context),
    footerDivider: IconButton(
      onPressed: () async {
        Navigator.of(context).pop();
        await apiUser.logout();
      },
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(white),
      ),
      icon: const Icon(Icons.logout),
      iconSize: 40,
      padding: const EdgeInsets.only(bottom: 40),
      hoverColor: Colors.transparent,
    ),
    headerBuilder: (context, extended) {
      return iconHeader(context, extended);
    },
    controller: sidebarController,
    items: [
      SidebarXItem(
        icon: Icons.home,
        label: 'Home',
        onTap: () => changeScreen(0),
      ),
      SidebarXItem(
          icon: Icons.account_tree_sharp,
          label: 'Menu builder',
          onTap: () => changeScreen(1)),
      SidebarXItem(
          icon: Icons.food_bank,
          label: 'Menu list',
          onTap: () => changeScreen(2)),
      SidebarXItem(
          icon: Icons.account_circle_outlined,
          label: 'Profile',
          onTap: () => changeScreen(3)),
    ],
    animationDuration: Durations.medium4,
  );
}
