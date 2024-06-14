import 'package:flutter/cupertino.dart';

const double _tabletBreakpoint = 600.0;
const double _desktopBreakpoint = 1024.0;

bool isDesktop(BuildContext context) {
  final MediaQueryData mediaQuery = MediaQuery.of(context);
  final double deviceWidthDp = mediaQuery.size.width / mediaQuery.devicePixelRatio;

  if (deviceWidthDp >= _desktopBreakpoint) {
    return true;
  } else {
    return false;
  }
}

bool isTablet(BuildContext context) {
  final MediaQueryData mediaQuery = MediaQuery.of(context);
  final double deviceWidthDp = mediaQuery.size.width / mediaQuery.devicePixelRatio;
  if (deviceWidthDp >= _tabletBreakpoint && deviceWidthDp < _desktopBreakpoint) {
    return true;
  } else {
    return false;
  }
}

bool isMobile(BuildContext context) {
  final MediaQueryData mediaQuery = MediaQuery.of(context);
  final double deviceWidthDp = mediaQuery.size.width / mediaQuery.devicePixelRatio;

  if (deviceWidthDp < _tabletBreakpoint) {
    return true;
  } else {
    return false;
  }
}