import 'package:crm_app/presentation/Views/JobSeeker/Apply_now/apply_now.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Saved/job_detail.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:flutter/material.dart';

class AllJobsScreen extends StatelessWidget {
  const AllJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: ListView(
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
            buttonText: "Apply Now",
            buttonColor: Color(0xff80D050),
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
            },            ),
          const SizedBox(height: 20),
          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "5hr Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "Remote"],
            location: "15 miles away, GA 30326, Atlanta",
            salary: "\$800 - 1.2k",
            isSaved: false,
            buttonText: "Apply Now",
            buttonColor: Color(0xff80D050),
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
            },            ),
          const SizedBox(height: 20),
          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "1 day Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "In Office"],
            location: "8 miles away, GA 30326, Atlanta",
            salary: "\$650 - 900",
            isSaved: false,
            buttonText: "Apply Now",
            buttonColor: Color(0xff80D050),
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
            },            ),
          const SizedBox(height: 20),
          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "3hr Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "Remote"],
            location: "20 miles away, GA 30326, Atlanta",
            salary: "\$900 - 1.5k",
            isSaved: false,
            buttonText: "Apply Now",
            buttonColor: Color(0xff80D050),
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
            },            ),
          const SizedBox(height: 20),
          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "6hr Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "In Office"],
            location: "12 miles away, GA 30326, Atlanta",
            salary: "\$1k - 1.8k",
            isSaved: false,
            buttonText: "Apply Now",
            buttonColor: Color(0xff80D050),
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
            },            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
