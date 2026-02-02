import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Apply_now/apply_now.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Saved/job_detail.dart';
import 'package:crm_app/presentation/Views/JobSeeker/See%20all%20Screens/saved_screen.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
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
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Saved",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: FrontendConfigs.kBlackColor,
                ),
              ),
            ),

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

            Expanded(
              child: ListView(
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SavedSeeAllScreen()),
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MyText(
                        text: "See All",
                        fontWeight: FontWeight.w500,
                        size: 12,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                  ),
                  Gap(10),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
