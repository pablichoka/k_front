import 'package:flutter/cupertino.dart';

const double MAX_TABLET_WIDTH = 1024;
const double MAX_MOBILE_WIDTH = 600;

bool isDesktop(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width > MAX_TABLET_WIDTH;
}

bool isTablet(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width <= MAX_TABLET_WIDTH && width > MAX_MOBILE_WIDTH;
}

bool isMobile(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width <= MAX_MOBILE_WIDTH;
}

bool is720p(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  return (width * devicePixelRatio) == 1280 && (height * devicePixelRatio) == 720;
}

bool is1080p(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  return (width * devicePixelRatio) == 1920 && (height * devicePixelRatio) == 1080;
}

bool is1440p(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  return (width * devicePixelRatio) == 2560 && (height * devicePixelRatio) == 1440;
}
