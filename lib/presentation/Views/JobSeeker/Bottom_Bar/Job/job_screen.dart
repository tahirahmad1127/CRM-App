import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Job/filter.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/All_applied_screen/all_applied_screen.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/All_jobs_screen/all_jobs_screen.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedFilter = 'All Jobs';

  final List<String> filters = ['All Jobs', 'Applied Jobs'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Jobs",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: FrontendConfigs.kBlackColor,
                ),
              ),
            ),

            // Tabbar
            SizedBox(
              height: screenHeight * 0.05,
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
                        margin: EdgeInsets.symmetric(horizontal: 5),
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

            Gap(15),

            if (selectedFilter == 'All Jobs')
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: searchController,
                      width: screenWidth * 0.7,
                      labelText: "Search...",
                      hintColor: Color(0xff6B6B6B),
                      fontWeight: FontWeight.w500,
                      prefixIcon: Image.asset('assets/images/search.png'),
                      backgroundColor: Color(0xffF5F5F5),
                      enableBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Color(0xffCECECE),
                          width: 0.4,
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  MyContainer(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilterScreen()),
                      );
                    },
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 5),
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: FrontendConfigs.kPrimaryColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/filter_icon.png",
                        width: 25,
                      ),
                    ),
                  ),
                ],
              ),

            if (selectedFilter == 'All Jobs')
              Gap(0),

            // Content based on selected tab
            Expanded(
              child: selectedFilter == 'All Jobs'
                  ? AllJobsScreen()
                  : AppliedJobsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}