import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedFilter = 'Full-Time';

  final List<String> filters = [
    'Full-Time',
    'Part-Time',
    'Daily Shift',
    'Nearby',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/profile_pic.png", width: 60),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Morgan mills",
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: FrontendConfigs.kBlackColor,
                        ),
                        MyText(
                          text: "Good Morning",
                          fontWeight: FontWeight.w400,
                          size: 12,
                          color: FrontendConfigs.kBlackColor,
                        ),
                      ],
                    ),
                  ),
                  MyContainer(
                    width: 40,
                    height: 36,
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(6),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/bell.png"),
                    ),
                  ),
                ],
              ),
              Gap(screenHeight * 0.03),

              MyTextField(
                controller: searchController,
                width: screenWidth * 0.9,
                labelText: "Search...",
                hintColor: Color(0xff6B6B6B),
                fontWeight: FontWeight.w500,
                prefixIcon: Image.asset('assets/images/search.png'),
                backgroundColor: Color(0xffF5F5F5),
                enableBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    color: Color(0xffCECECE),   // 🔹 Border colour
                    width: 0.4,           // 🔹 Border width
                  ),
                ),
              ),
              Gap(screenHeight * 0.025),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: filters.map((filter) {
                  final isSelected = selectedFilter == filter;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color(0xff80D050)
                            : Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isSelected
                              ? Color(0xff80D050)
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        filter,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? Colors.white : Color(0xff9A9A9A),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Gap(screenHeight * 0.02),
              MyText(
                text: "Recommended Jobs",
                fontWeight: FontWeight.w600,
                size: 16,
                color: FrontendConfigs.kBlackColor,
              ),
              Gap(screenHeight * 0.02),
              SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: JobCard(
                        width: screenWidth * 0.7,
                        logoPath: "assets/images/id_pic.png",
                        companyName: "BELLE",
                        timeAgo: "2hr Ago",
                        jobTitle: "Senior Industrial Manager",
                        tags: ["Full-Time", "In Office"],
                        location: "11 miles away, GA 30326, Atlanta",
                        salary: "\$750 - 1k",
                        isSaved: true,
                        onApply: () {},
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: JobCard(
                        width: screenWidth * 0.7,
                        logoPath: "assets/images/id_pic.png",
                        companyName: "BELLE",
                        timeAgo: "2hr Ago",
                        jobTitle: "Senior Industrial Manager",
                        tags: ["Full-Time", "In Office"],
                        location: "11 miles away, GA 30326, Atlanta",
                        salary: "\$750 - 1k",
                        isSaved: true,
                        onApply: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Gap(screenHeight * 0.02),
              MyText(
                text: "Recently Viewed",
                fontWeight: FontWeight.w600,
                size: 16,
                color: FrontendConfigs.kBlackColor,
              ),
              Gap(screenHeight * 0.02),
              SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: 10),
                      child: JobCard(
                        width: screenWidth * 0.7,
                        logoPath: "assets/images/id_pic.png",
                        companyName: "BELLE",
                        timeAgo: "2hr Ago",
                        jobTitle: "Senior Industrial Manager",
                        tags: ["Full-Time", "In Office"],
                        location: "11 miles away, GA 30326, Atlanta",
                        salary: "\$750 - 1k",
                        isSaved: true,
                        onApply: () {},
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: JobCard(
                        width: screenWidth * 0.7,
                        logoPath: "assets/images/id_pic.png",
                        companyName: "BELLE",
                        timeAgo: "2hr Ago",
                        jobTitle: "Senior Industrial Manager",
                        tags: ["Full-Time", "In Office"],
                        location: "11 miles away, GA 30326, Atlanta",
                        salary: "\$750 - 1k",
                        isSaved: true,
                        onApply: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
