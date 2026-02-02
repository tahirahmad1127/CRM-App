import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Apply_now/apply_now.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Saved/job_detail.dart';
import 'package:crm_app/presentation/Views/JobSeeker/See%20all%20Screens/recently_viewed_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/See%20all%20Screens/recommended_see_all.dart';
import 'package:crm_app/presentation/Views/JobSeeker/notification%20screen/notification%20screen.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Earning/calender/calender.dart';
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
          padding: const EdgeInsets.only(left: 20, top: 50, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
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
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CalendarScreen()),
                          );
                        },
                        child: const Center(
                          child: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),

                    Gap(10),
                    MyContainer(
                      width: 40,
                      height: 36,
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(6),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => NotificationScreen()),
                          );
                        },
                        icon: Image.asset("assets/images/bell.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(screenHeight * 0.03),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: MyTextField(
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
                      width: screenWidth * 0.206,
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
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    MyText(
                      text: "Recommended Jobs",
                      fontWeight: FontWeight.w600,
                      size: 16,
                      color: FrontendConfigs.kBlackColor,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RecommendedSeeAllScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyText(
                          text: "See All",
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: FrontendConfigs.kBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(screenHeight * 0.02),
              SizedBox(
                height: 260,
                child: ListView(
                  padding: EdgeInsets.zero,
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
                        onApply: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ApplyNowScreen(jobTitle: 'Senior Industrial Manager', companyName: 'BELLE')),
                          );
                        },
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => JobDetailsScreen()),
                          );
                        },
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
                        onApply: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ApplyNowScreen(jobTitle: 'Senior Industrial Manager', companyName: 'BELLE')),
                          );
                        },
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => JobDetailsScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Gap(screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    MyText(
                      text: "Recently Viewed",
                      fontWeight: FontWeight.w600,
                      size: 16,
                      color: FrontendConfigs.kBlackColor,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RecentlyViewedSeeAllScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyText(
                          text: "See All",
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: FrontendConfigs.kBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(screenHeight * 0.02),
              SizedBox(
                height: 260,
                child: ListView(
                  padding: EdgeInsets.zero,
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
                        onApply: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ApplyNowScreen(jobTitle: 'Senior Industrial Manager', companyName: 'BELLE')),
                          );
                        },
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => JobDetailsScreen()),
                          );
                        },
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
                        onApply: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ApplyNowScreen(jobTitle: 'Senior Industrial Manager', companyName: 'BELLE')),
                          );
                        },
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => JobDetailsScreen()),
                          );
                        },
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