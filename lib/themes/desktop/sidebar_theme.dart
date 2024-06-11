import 'package:flutter/material.dart';
import 'package:k_front/themes/theme_data.dart';
import 'package:sidebarx/sidebarx.dart';

SidebarXTheme desktopCollapsedTheme(BuildContext context) {
  var theme = SidebarXTheme(
    width: 100,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
    hoverColor: Theme.of(context).hoverColor,
    textStyle: nonSelectedSidebarTextStyle,
    selectedTextStyle: selectedSidebarTextStyle,
    hoverTextStyle: selectedSidebarTextStyle,
    itemTextPadding: const EdgeInsets.only(left: 30),
    selectedItemTextPadding: const EdgeInsets.only(left: 30),
    itemDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    selectedItemDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: white,
      boxShadow: [
        BoxShadow(
          color: dark.withOpacity(0.3),
          blurRadius: 30,
        )
      ],
    ),
    iconTheme: const IconThemeData(
      color: white,
      size: 40,
    ),
    selectedIconTheme: const IconThemeData(
      color: dark,
      size: 40,
    ),
  );
  return theme;
}

SidebarXTheme desktopExtendedTheme(BuildContext context) {
  var theme = SidebarXTheme(
    width: 250,

    itemDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    itemMargin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
    selectedItemMargin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
    selectedItemDecoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(20),
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
    ),
  );
  return theme;
}

iconHeader(BuildContext context, bool extended) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.15,
    child: Center(
      child: Icon(Icons.fastfood, size: extended ? 70 : 50, color: white),
    ),
  );
}

const nonSelectedSidebarTextStyle =
    TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold);

const selectedSidebarTextStyle =
    TextStyle(color: dark, fontSize: 16, fontWeight: FontWeight.bold);