import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Job/filter.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
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
              padding: const EdgeInsets.symmetric(vertical: 10),
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
                    "Job ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: FrontendConfigs.kBlackColor,
                    ),
                  ),
                ],
              ),
            ),

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
                        color: Color(0xffCECECE),   // 🔹 Border colour
                        width: 0.4,           // 🔹 Border width
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
            Expanded(
              child: ListView(
                children: [
                  JobCard(
                    width: double.infinity,
                    logoPath: "assets/images/id_pic.png",
                    companyName: "BELLE",
                    timeAgo: "2hr Ago",
                    jobTitle: "Senior Industrial Manager",
                    tags: ["Full-Time", "In Office"],
                    location: "11 miles away, GA 30326, Atlanta",
                    salary: "\$750 - 1k",
                    isSaved: false,
                    onApply: () {},
                  ),
                  const SizedBox(height: 20),
                  JobCard(
                    width: double.infinity,
                    logoPath: "assets/images/id_pic.png",
                    companyName: "BELLE",
                    timeAgo: "2hr Ago",
                    jobTitle: "Senior Industrial Manager",
                    tags: ["Full-Time", "In Office"],
                    location: "11 miles away, GA 30326, Atlanta",
                    salary: "\$750 - 1k",
                    isSaved: false,
                    onApply: () {},
                  ),
                  const SizedBox(height: 20),
                  JobCard(
                    width: double.infinity,

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
