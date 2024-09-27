// import 'package:flutter/material.dart';
// import 'package:k_front/themes/theme_data.dart';
// import 'package:sidebarx/sidebarx.dart';
//
// SidebarXTheme mobileCollapsedTheme(BuildContext context) {
//   var theme = SidebarXTheme(
//     width: 100,
//     margin: const EdgeInsets.all(10),
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     hoverColor: hoverLightColor,
//     textStyle: sidebarTextStyle,
//     selectedTextStyle:
//         const TextStyle(color: dark, fontSize: 16, fontWeight: FontWeight.bold),
//     hoverTextStyle:
//         const TextStyle(color: dark, fontSize: 16, fontWeight: FontWeight.bold),
//     itemTextPadding: const EdgeInsets.only(left: 30),
//     selectedItemTextPadding: const EdgeInsets.only(left: 30),
//     itemDecoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     selectedItemDecoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       color: white,
//       boxShadow: [
//         BoxShadow(
//           color: dark.withOpacity(0.1),
//           blurRadius: 30,
//         )
//       ],
//     ),
//     iconTheme: const IconThemeData(
//       color: white,
//       size: 40,
//     ),
//     selectedIconTheme: const IconThemeData(
//       color: dark,
//       size: 40,
//     ),
//   );
//   return theme;
// }
//
// SidebarXTheme mobileExtendedTheme(BuildContext context) {
//   var theme = SidebarXTheme(
//     width: 250,
//     itemDecoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     itemMargin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
//     selectedItemDecoration: BoxDecoration(
//       color: white,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     decoration: BoxDecoration(
//       color: Theme.of(context).primaryColor,
//     ),
//   );
//   return theme;
// }
//
// iconHeader(BuildContext context){
//   return SizedBox(
//   height: MediaQuery.of(context).size.height * 0.15,
//   child: const Center(
//     child: Icon(Icons.fastfood, size: 70, color: white),
//   ),
// );
// }
//
// const sidebarTextStyle =
//     TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold);
