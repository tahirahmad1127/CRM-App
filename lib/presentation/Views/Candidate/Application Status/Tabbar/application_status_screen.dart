import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/All_applied_screen/all_applied_screen.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/All_jobs_screen/all_jobs_screen.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Interview/interview_detail.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
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
  String selectedFilter = 'All Jobs';

  final List<String> filters = ['All Jobs', 'Applied Jobs'];

  Widget _getSelectedScreen() {
    switch (selectedFilter) {
      case 'All Jobs':
        return AllJobsScreen();
      case 'Applied Jobs':
        return AppliedJobsScreen();
      default:
        return AllJobsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
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

            SizedBox(
              height: screenHeight * 0.05,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: List.generate(filters.length, (index) {
                    final filter = filters[index];
                    final isSelected = selectedFilter == filter;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5), // spacing between tabs
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
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xff9A9A9A),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Expanded(
              child: _getSelectedScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
