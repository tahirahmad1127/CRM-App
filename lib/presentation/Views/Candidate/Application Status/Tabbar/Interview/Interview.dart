import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Interview/interview_detail.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InterView extends StatefulWidget {
  const InterView({super.key});

  @override
  State<InterView> createState() => _InterViewState();
}

class _InterViewState extends State<InterView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
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
                    buttonText: "View Detail",
                    showStatusButton: true,
                    statusText: "Interview in 2 days",
                    statusColor: Color(0xff1E90FF),
                    buttonTextColor: Color(0xff80D050),
                    buttonColor: Colors.transparent,
                    buttonBorderColor: const Color(0xff80D050),
                    buttonBorderWidth: 1,
                    onApply: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterviewDetails(),
                        ),
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
                    isSaved: false,
                    buttonText: "View Detail",
                    showStatusButton: true,
                    statusText: "Interview in 2 days",
                    statusColor: Color(0xff1E90FF),
                    buttonTextColor: Color(0xff80D050),
                    buttonColor: Colors.transparent,
                    buttonBorderColor: const Color(0xff80D050),
                    buttonBorderWidth: 1,
                    onApply: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterviewDetails(),
                        ),
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
                    isSaved: false,
                    buttonText: "View Detail",
                    showStatusButton: true,
                    statusText: "Interview in 2 days",
                    statusColor: Color(0xff1E90FF),
                    buttonTextColor: Color(0xff80D050),
                    buttonColor: Colors.transparent,
                    buttonBorderColor: const Color(0xff80D050),
                    buttonBorderWidth: 1,
                    onApply: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterviewDetails(),
                        ),
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
