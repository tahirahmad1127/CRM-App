import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Interview/interview_detail.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Offered/offered_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Apply_now/apply_now.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Saved/job_detail.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:flutter/material.dart';

class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: ListView(
        children: [
          // Applied Jobs
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
            buttonText: "Applied",
            buttonColor: Color(0xff4A90E2),
            onApply: () {
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
            buttonText: "Applied",
            buttonColor: Color(0xff4A90E2),
            onApply: () {
            },
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },            ),
          const SizedBox(height: 20),

          // Shortlisted Jobs
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
            buttonText: "Shortlisted",
            buttonColor: Color(0xffF5A623),
            onApply: () {
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
            buttonText: "Shortlisted",
            buttonColor: Color(0xffF5A623),
            onApply: () {
            },
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },            ),
          const SizedBox(height: 20),

          // Interview Jobs
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
            buttonText: "View Detail",
            showStatusButton: true,
            statusText: "Interview in 2 days",
            statusColor: Color(0xff1E90FF),
            buttonTextColor: Color(0xff80D050),
            buttonColor: Colors.transparent,
            buttonBorderColor: const Color(0xff80D050),
            buttonBorderWidth: 1,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },
            onApply: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InterviewDetails()),
              );
            },
          ),
          const SizedBox(height: 20),

          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "1 day Ago",
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
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },
            onApply: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InterviewDetails()),
              );
            },
          ),
          const SizedBox(height: 20),

          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "2 days Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "Remote"],
            location: "15 miles away, GA 30326, Atlanta",
            salary: "\$800 - 1.2k",
            isSaved: false,
            buttonText: "View Detail",
            showStatusButton: true,
            statusText: "Interview in 2 days",
            statusColor: Color(0xff1E90FF),
            buttonTextColor: Color(0xff80D050),
            buttonColor: Colors.transparent,
            buttonBorderColor: const Color(0xff80D050),
            buttonBorderWidth: 1,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },
            onApply: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InterviewDetails()),
              );
            },
          ),
          const SizedBox(height: 20),

          // More Applied
          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "3 days Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "In Office"],
            location: "8 miles away, GA 30326, Atlanta",
            salary: "\$650 - 900",
            isSaved: false,
            buttonText: "Applied",
            buttonColor: Color(0xff4A90E2),
            onApply: () {},
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },            ),
          const SizedBox(height: 20),

          // Offered Jobs
          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "4 days Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "In Office"],
            location: "11 miles away, GA 30326, Atlanta",
            salary: "\$750 - 1k",
            isSaved: false,
            buttonText: "Offered",
            buttonColor: Color(0xff9B59B6),
            buttonTextColor: Colors.white,
            showOfferedButton: true,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },
            onApply: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Offered()),
              );
            },
          ),
          const SizedBox(height: 20),

          JobCard(
            width: double.infinity,
            logoPath: "assets/images/id_pic.png",
            companyName: "BELLE",
            timeAgo: "5 days Ago",
            jobTitle: "Senior Industrial Manager",
            tags: ["Full-Time", "Remote"],
            location: "20 miles away, GA 30326, Atlanta",
            salary: "\$900 - 1.5k",
            isSaved: false,
            buttonText: "Offered",
            buttonColor: Color(0xff9B59B6),
            buttonTextColor: Colors.white,
            showOfferedButton: true,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen()),
              );
            },
            onApply: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Offered()),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
