import 'package:flutter/material.dart';

class QrCodePainter extends CustomPainter {
  final double adjust, position, sizeCurve, radius;
  final Shadow shadow;
  final Color color;
  final PaintingStyle paintingStyle;

  QrCodePainter({
    this.adjust = 5,
    this.position = 15,
    this.sizeCurve = 8,
    this.radius = 5,
    this.color = Colors.white,
    this.paintingStyle = PaintingStyle.fill,
    this.shadow = const Shadow(
      blurRadius: 12.0,
      color: Colors.black,
    ),
  });

  double _converter(double value) {
    return value / 100;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = paintingStyle;

    Path path = Path();

    path.moveTo(size.width * _converter(adjust), 0);
    path.lineTo(size.width * (1 - _converter(adjust)), 0);
    path.quadraticBezierTo(
        size.width, 0, size.width, size.height * _converter(adjust));
    //curves
    path.lineTo(size.width, size.height * _converter(position));
    path.arcToPoint(
      Offset(size.width,
          size.height * (_converter(position) + _converter(sizeCurve))),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    //....
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    //curves
    path.lineTo(
        0, size.height * (_converter(position) + _converter(sizeCurve)));
    path.arcToPoint(
      Offset(0, size.height * _converter(position)),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    //......
    path.lineTo(0, size.height * _converter(adjust));
    path.quadraticBezierTo(0, 0, size.width * _converter(adjust), 0);
    path.close();
    canvas.drawShadow(path, shadow.color, shadow.blurRadius, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
