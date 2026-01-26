import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Shortlisted extends StatefulWidget {
  const Shortlisted({super.key});

  @override
  State<Shortlisted> createState() => _ShortlistedState();
}

class _ShortlistedState extends State<Shortlisted> {

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
                    buttonText: "Shortlisted",
                    buttonColor: Color(0xffF5A623),
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
                    buttonText: "Shortlisted",
                    buttonColor: Color(0xffF5A623),
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
                    buttonText: "Shortlisted",
                    buttonColor: Color(0xffF5A623),
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
