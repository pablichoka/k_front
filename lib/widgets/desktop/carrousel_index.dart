import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class IndexDesktopCarousel extends StatefulWidget {
  const IndexDesktopCarousel(BuildContext context, {super.key});

  @override
  IndexDesktopCarouselState createState() => IndexDesktopCarouselState();
}

class IndexDesktopCarouselState extends State<IndexDesktopCarousel> {
  final _controller = InfiniteScrollController(initialItem: 0);
  late final _currentIndex = ValueNotifier<int>(0);

  List<Widget> indexDots(BuildContext context, int itemCount, int currentIndex) {
    final List<Widget> dots = [];
    for (var i = 0; i < itemCount; i++) {
      dots.add(
        IconButton(
          iconSize: 10,
          onPressed: () {
            //FIXME: This is just fucking not working
            _controller.jumpToItem(i);
          },
          icon: Icon(
            Icons.circle_rounded,
            color: i == currentIndex
                ? Theme.of(context).highlightColor
                : Theme.of(context).disabledColor,
          ),
        ),
      );
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InfiniteCarousel.builder(
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              // Allows to swipe in web browsers
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse
            },
          ),
          itemCount: 4,
          itemExtent: MediaQuery.of(context).size.width * 0.6,
          center: true,
          anchor: 0.0,
          velocityFactor: 0.3,
          onIndexChanged: (index) {
            _currentIndex.value = index;
          },
          controller: _controller,
          axisDirection: Axis.horizontal,
          loop: true,
          itemBuilder: (context, itemIndex, realIndex) {
            return Card(
              color: Theme.of(context).primaryColorLight.withOpacity(0.5),
              child: Center(
                child: Text('Item $itemIndex',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
            );
          },
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.90,
            transform: Matrix4.translationValues(
                0, MediaQuery.of(context).size.height * 0.40, 0),
            child: ValueListenableBuilder<int>(
              valueListenable: _currentIndex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: indexDots(context, 4, value),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}