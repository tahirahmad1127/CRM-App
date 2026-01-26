import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final String selectedTab;
  final Function(String) onTabSelected;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tabs.map((tab) {
        final isSelected = selectedTab == tab;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => onTabSelected(tab),
              child: Container(
                height: screenHeight * 0.05,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xff80D050) : Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isSelected ? Color(0xff80D050) : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Text(
                  tab,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Color(0xff9A9A9A),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}