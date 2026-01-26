import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class MyPinCode extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final Color? color;
  final bool readOnly;
  final int length;

  const MyPinCode({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.controller,
    this.color,
    this.onSubmitted,
    this.readOnly = false,
    required this.length,
  });

  @override
  State<MyPinCode> createState() => _MyPinCodeState();
}

class _MyPinCodeState extends State<MyPinCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 45,
      textStyle: TextStyle(
        fontSize: 18,
        fontFamily: "Poppins",
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.61),
        color: Colors.white,
        border: Border.all(
          color: Color(0xff9A9A9A),
          width: 0.24,
        ),
      ),
    );

    final focusedPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
        fontSize: 20,
        fontFamily: "Poppins",
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: FrontendConfigs.kBlackColor,
          width: 1.5,
        ),
      ),
    );

    return Pinput(
      length: widget.length,
      readOnly: widget.readOnly,
      controller: widget.controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme,
      textInputAction: TextInputAction.done,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      separatorBuilder: (index) => SizedBox(width: 12),
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
    );
  }
}