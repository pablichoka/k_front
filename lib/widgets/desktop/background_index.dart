import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(context),
      child: Container(),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final BuildContext context;

  BackgroundPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Theme.of(context).primaryColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    Path trianglePath = Path();
    trianglePath.moveTo(0, size.height * 0.6);
    trianglePath.lineTo(size.width, size.height * 0.6);
    trianglePath.lineTo(size.width, size.height);
    trianglePath.close();
    paint.color = Theme.of(context).primaryColor;
    canvas.drawPath(trianglePath, paint);

    Path bottomPath = Path();
    bottomPath.moveTo(0, size.height * 0.9);
    bottomPath.lineTo(size.width, size.height * 0.8);
    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(0, size.height);
    bottomPath.close();

    paint.color = Theme.of(context).highlightColor;
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
