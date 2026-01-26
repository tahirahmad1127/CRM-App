import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../configurations/frontend_configs.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function()? onTap;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final bool readOnly;
  final FontWeight? fontWeight;
  final TextStyle? suffixStyle;
  final TextStyle? prefixStyle;
  final BoxConstraints? prefixIconConstraints;
  final TextStyle? inputTextStyle;
  final String? btnLabel;
  final TextStyle? hintStyle;
  final BorderRadius? borderRadius;
  final AutovalidateMode? autoValidateMode;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final Color? backgroundColor;
  final Color? cursorColor;
  final Color? hintColor;
  final Color? textColor;
  final double? hintSize;
  final double? textSize;
  final int? hintMaxLines;
  final int? maxLines;
  final TextAlign? textAlign;
  final String? initialTextValue;
  final FocusNode? focusNode;
  final bool isPasswordField;
  final bool isSecure;

  /// 👇 Updated: Can be `IconData` OR `String` (asset path)
  final dynamic suffixIcon;
  final dynamic prefixIcon;

  final VoidCallback? onSuffixTap;
  final bool isSuffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconHeight;
  final double? suffixIconWidth;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? textInputFormatters;
  final String? labelText;
  final bool removeBorder;
  final Color? prefixIconColor;
  final double? prefixIconHeight;
  final double? prefixIconWidth;

  const MyTextField({
    super.key,
    this.btnLabel,
    this.fontWeight,
    this.onSuffixTap,
    this.initialTextValue,
    this.hintMaxLines,
    this.hintStyle,
    this.textColor,
    this.hintSize,
    this.focusNode,
    this.textAlign,
    this.textSize,
    this.prefixIconConstraints,
    this.backgroundColor,
    this.hintColor,
    this.suffixIconColor,
    this.cursorColor,
    this.controller,
    this.borderRadius,
    this.hintText,
    this.inputTextStyle,
    this.onTap,
    this.height,
    this.textInputAction,
    this.contentPadding,
    this.width,
    this.maxLines,
    this.readOnly = false,
    this.suffixStyle,
    this.prefixStyle,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.autoValidateMode,
    this.border,
    this.focusedBorder,
    this.enableBorder,
    this.isPasswordField = false,
    this.isSecure = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isSuffixIcon = false,
    this.removeBorder = false,
    this.suffixIconHeight,
    this.suffixIconWidth,
    this.textInputFormatters,
    this.onChanged,
    this.labelText,
    this.prefixIconColor,
    this.prefixIconHeight,
    this.prefixIconWidth,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool isTextObscured;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    isTextObscured = widget.isSecure;
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  Widget? _buildSuffixIcon() {
    // Use the passed suffixIcon first
    if (widget.isSuffixIcon && widget.suffixIcon != null) {
      if (widget.suffixIcon is IconData) {
        return Icon(
          widget.suffixIcon as IconData,
          size: widget.suffixIconHeight ?? 20,
          color: widget.suffixIconColor ?? const Color(0xffB8BABF),
        );
      } else if (widget.suffixIcon is String) {
        return Image.asset(
          widget.suffixIcon as String,
          height: widget.suffixIconHeight ?? 20,
          width: widget.suffixIconWidth ?? 20,
          fit: BoxFit.contain,
          color: widget.suffixIconColor,
        );
      } else if (widget.suffixIcon is Widget) {
        return widget.suffixIcon as Widget;
      }
    }

    // Fallback for password fields
    if (widget.isPasswordField) {
      return Image.asset(
        isTextObscured
            ? 'assets/images/eye_slash.png'
            : 'assets/images/eye.png',
        height: widget.suffixIconHeight ?? 20,
        width: widget.suffixIconWidth ?? 20,
      );
    }

    return null;
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon != null) {
      if (widget.prefixIcon is IconData) {
        return Icon(
          widget.prefixIcon as IconData,
          size: widget.prefixIconHeight ?? 20,
          color: widget.prefixIconColor ?? Colors.black,
        );
      } else if (widget.prefixIcon is String) {
        return Image.asset(
          widget.prefixIcon as String,
          height: widget.prefixIconHeight ?? 24,
          width: widget.prefixIconWidth ?? 24,
          fit: BoxFit.cover,
          color: widget.prefixIconColor ?? Colors.black,
        );
      } else if (widget.prefixIcon is Widget) {
        return widget.prefixIcon as Widget;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      focusNode: _focusNode,
      inputFormatters: widget.textInputFormatters,
      initialValue: widget.initialTextValue,
      textAlign: widget.textAlign ?? TextAlign.start,
      autovalidateMode: widget.autoValidateMode,
      onTap: widget.onTap,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPasswordField ? isTextObscured : false,
      obscuringCharacter: "●",
      readOnly: widget.readOnly,
      autofocus: false,
      maxLines: widget.maxLines ?? 1,
      validator: widget.validator,
      cursorColor: widget.cursorColor ?? Colors.black,
      style: widget.inputTextStyle ??
          TextStyle(
            color: widget.textColor ?? FrontendConfigs.kTextFieldHintColor,
            fontFamily: 'Poppins',
            fontSize: widget.textSize ?? 14,
            fontWeight: widget.fontWeight ?? FontWeight.w600,
          ),
      decoration: InputDecoration(

        enabledBorder: widget.enableBorder ??
            (widget.border ?? OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 0.6),
            )),

        focusedBorder: widget.focusedBorder ??
            (widget.border ?? OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 0.6),
            )),

        errorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 0.6),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 0.6),
        ),



        filled: true,
        fillColor: widget.backgroundColor ?? Colors.white,
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xff6B6B6B),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
              fontFamily: 'Poppins',
              color: widget.hintColor ?? FrontendConfigs.kTextFieldHintColor,
              fontSize: widget.hintSize ?? 14,
              fontWeight: FontWeight.w400,
            ),
        isDense: true,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: _buildPrefixIcon(),
        )
            : null,
        prefixIconConstraints: widget.prefixIcon != null
            ? BoxConstraints(
          minWidth: (widget.prefixIconWidth ?? 20) + 15,
          minHeight: widget.prefixIconHeight ?? 20,
          maxWidth: (widget.prefixIconWidth ?? 24) + 15,
          maxHeight: widget.prefixIconHeight ?? 24,
        )
            : null,
        suffixIcon: widget.isSuffixIcon || widget.isPasswordField
            ? GestureDetector(
          onTap: widget.isPasswordField
              ? () {
            setState(() {
              isTextObscured = !isTextObscured;
            });
          }
              : widget.onSuffixTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _buildSuffixIcon(),
          ),
        )
            : null,
        suffixIconConstraints: widget.isSuffixIcon || widget.isPasswordField
            ? BoxConstraints(
          minWidth: 48,
          minHeight: widget.height ?? 56,
        )
            : null,
      ),
    );
  }
}