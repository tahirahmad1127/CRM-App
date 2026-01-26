import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Applied/Applied.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Hired/hired.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Interview/Interview.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Offered/offered_screen.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/shortlisted/Shortlisted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationStatusTabs extends StatefulWidget {
  const ApplicationStatusTabs({super.key});

  @override
  State<ApplicationStatusTabs> createState() => _ApplicationStatusTabsState();
}

class _ApplicationStatusTabsState extends State<ApplicationStatusTabs> {
  String selectedFilter = 'Applied';

  final List<String> filters = [
    'Applied',
    'Shortlisted',
    'Interview',
    'Offered',
    'Hired'
  ];

  Widget _getSelectedScreen() {
    switch (selectedFilter) {
      case 'Applied':
        return  Applied();
      case 'Shortlisted':
        return  Shortlisted();
      case 'Interview':
        return  InterView();
      case 'Offered':
        return  Offered();
      case 'Hired' :
        return  Hired();
      default:
        return  Applied();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(CupertinoIcons.arrow_left),
                    ),
                  ),
                  Text(
                    "Application Status",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: FrontendConfigs.kBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),

            // 👇 Horizontally Scrollable TabBar
            SizedBox(
              height: screenHeight * 0.05,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                separatorBuilder: (context, index) => Gap(8),
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = selectedFilter == filter;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xff80D050)
                            : const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xff80D050)
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xff9A9A9A),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: _getSelectedScreen(),
            ),
          ],
        ),
      ),
    );
  }
}