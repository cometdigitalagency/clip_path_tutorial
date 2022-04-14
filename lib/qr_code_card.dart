import 'package:clip_path_tutorial/footer.dart';
import 'package:clip_path_tutorial/qr_code_painter.dart';
import 'package:flutter/material.dart';

class QrCodeCard extends StatelessWidget {
  final double width, height, footerHeight, radius, blurRadius;
  final EdgeInsetsGeometry padding;
  final Widget child, footerChild;
  final Color footerColor, shadowColor;
  const QrCodeCard({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    required this.footerChild,
    this.blurRadius = 16,
    this.shadowColor = Colors.black,
    this.footerColor = const Color(0xFFE43434),
    this.radius = 16,
    this.footerHeight = 100,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(width, height),
          painter: QrCodePainter(
              adjust: radius * 0.3125,
              shadow: Shadow(
                blurRadius: blurRadius,
                color: Colors.black,
              )),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            child: child,
          ),
        ),
        Footer(
          width: width,
          height: footerHeight,
          radius: radius,
          footerColor: footerColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: blurRadius * 0.375,
              color: shadowColor.withOpacity(.2),
            ),
          ],
          child: footerChild,
        ),
      ],
    );
  }
}
