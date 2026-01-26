import 'package:country_code_picker/country_code_picker.dart';
import 'package:crm_app/presentation/constants/app_constant.dart';
import 'package:flutter/material.dart';

import '../../configurations/frontend_configs.dart';
import 'my_handle_bar.dart';
import 'my_logger.dart'; // for .wGap if you have custom extension

class CustomPhoneField extends StatefulWidget {
  final Function(String fullNumber)? onChanged;
  final String initialCountryCode;
  final TextEditingController? controller;

  const CustomPhoneField({
    super.key,
    this.onChanged,
    this.initialCountryCode = 'US',
    this.controller,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  String _countryCode = '+1';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FrontendConfigs.kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: FrontendConfigs.kBlackColor),
      ),
      child: Row(
        children: [
          // Country picker with flag + dial code
          CountryCodePicker(
            onChanged: (country) {
              setState(() {
                _countryCode = country.dialCode!;
                _phoneNumber = _countryCode + (widget.controller?.text ?? '');
                AppLogger.debug(_countryCode.toString());
                widget.onChanged?.call(_phoneNumber);
              });
            },
            initialSelection: widget.initialCountryCode,
            favorite: ['+1', 'US'],
            showCountryOnly: true,
            showOnlyCountryWhenClosed: false,
            showFlag: true,
            showFlagDialog: true,
            showDropDownButton: true,
            alignLeft: false,
            padding: EdgeInsets.zero,
            textStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 0,
            ),
            dialogTextStyle: TextStyle(
              fontFamily: 'Sk-Modernist',
              color: FrontendConfigs.kBlackColor,
              fontSize: 14,
            ),
            searchStyle: TextStyle(
              fontFamily: 'Sk-Modernist',
              color: FrontendConfigs.kBlackColor,
              fontSize: 14,
            ),
            flagDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            flagWidth: 24,
            builder: (country) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Flag
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.asset(
                      'packages/country_code_picker/${country!.flagUri!}',
                      width: 24,
                    ),
                  ),
                ),

                8.hGap,

                // Dial code
                Text(
                  "(${country.dialCode})",
                  style: const TextStyle(
                    fontFamily: 'Sk-Modernist',
                    color: Color(0xff313131),
                    fontSize: 14,
                  ),
                ),

                4.hGap,

                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 20,
                  color: Color(0xffADAFBB),
                ),

                4.hGap,

                const MyHandleBar(
                  height: 18,
                  width: 1,
                  color: Color(0xffE8E6EA),
                ),

                4.hGap,
              ],
            ),
          ),

          10.hGap,

          // Phone number field
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                setState(() {
                  _phoneNumber = _countryCode + value;
                  AppLogger.debug(_phoneNumber.toString());
                  widget.onChanged?.call(_phoneNumber);
                });
              },
              style: TextStyle(
                color: FrontendConfigs.kBlackColor,
                fontFamily: 'Sk-Modernist',
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintText: 'Phone number',
                hintStyle: TextStyle(
                  fontFamily: 'Sk-Modernist',
                  color: FrontendConfigs.kSecondaryTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(right: 10, top: 15, bottom: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
