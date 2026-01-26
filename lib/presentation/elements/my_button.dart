import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../configurations/frontend_configs.dart';

class MyButton extends StatelessWidget {
  final String btnLabel;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? letterSpacing;
  final bool isLoading;
  final Border? border;
  final String? fontFamily;
  final BorderRadius? borderRadius;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const MyButton({
    super.key,
    required this.btnLabel,
    required this.onPressed,
    this.color,
    this.textColor,
    this.height,
    this.width,
    this.border,
    this.letterSpacing,
    this.fontSize,
    this.fontFamily,
    this.borderRadius,
    this.fontWeight,
    this.isLoading = false,
    this.textStyle,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Animate(
      effects: const [
        FadeEffect(duration: Duration(milliseconds: 1000)),
        MoveEffect(curve: Curves.fastLinearToSlowEaseIn),
      ],
      child: Bounce(
        duration: const Duration(milliseconds: 100),
        onPressed: onPressed,
        child: Container(
          margin: margin ?? EdgeInsets.only(bottom: 10),
          padding: padding,
          height: height ?? 56,
          width: width ?? screenWidth * 0.9,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            border: border,
            color: color ?? const Color(0xff80D050),
            // gradient: color == null
            //     ? const LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   colors: [Color(0xffF1C7BA), Color(0xffDEA193)],
            // )
            //     : null,
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(0, 4),
            //     blurRadius: 4,
            //     color: FrontendConfigs.kBlackColor.withValues(alpha: 0.25),
            //   ),
            // ],
          ),
          child: Center(
            child: Text(
              btnLabel,
              style:
                  textStyle ??
                  GoogleFonts.poppins(
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    // corrected from w00
                    letterSpacing: letterSpacing ?? 0,
                    color:
                        textColor ?? FrontendConfigs.kScaffoldBackgroundColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
