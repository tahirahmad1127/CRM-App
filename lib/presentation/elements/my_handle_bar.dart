import 'package:flutter/material.dart';

class MyHandleBar extends StatelessWidget {
  final double height;
  final double width;

  /// Optional solid color (overrides gradient)
  final Color? color;

  /// Optional custom gradient colors (used only when color == null)
  final Color startColor;
  final Color endColor;

  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;

  const MyHandleBar({
    super.key,
    this.height = 1,
    this.width = 63,
    this.color,
    this.startColor = const Color(0xffF1C7BA),
    this.endColor = const Color(0xffDEA193),
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
        color: color, // used only when solid color mode
        gradient: color == null
            ? LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [startColor, endColor],
        )
            : null,
      ),
    );
  }
}
