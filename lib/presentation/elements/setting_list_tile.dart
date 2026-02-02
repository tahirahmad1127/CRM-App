import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Widget? trailing;
  final bool showDivider;
  final double paddingVertical; // NEW: vertical padding

  const SettingsListTile({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor,
    this.trailing,
    this.showDivider = true,
    this.paddingVertical = 16, // default to match old behavior
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: paddingVertical, // use the new parameter
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? const Color(0xff424242),
                  ),
                ),
                trailing ??
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xff7E7E7E),
                    ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffE0E0E0),
          ),
      ],
    );
  }
}
