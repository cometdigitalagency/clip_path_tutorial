import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    required this.footerColor,
    required this.child,
    this.boxShadow,
  }) : super(key: key);

  final double width, height, radius;
  final Color footerColor;
  final List<BoxShadow>? boxShadow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: footerColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
          boxShadow: boxShadow),
      child: child,
    );
  }
}
