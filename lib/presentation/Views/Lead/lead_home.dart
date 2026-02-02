import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post.dart';
import 'package:crm_app/presentation/Views/Clients/BottomBarFiles/Job/job_screen.dart';
import 'package:crm_app/presentation/Views/Clients/TimeSheet/client_timesheet.dart';
import 'package:crm_app/presentation/Views/Clients/Workers/client_workers_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/saved_profile.dart';
import 'package:crm_app/presentation/Views/JobSeeker/notification%20screen/notification%20screen.dart';
import 'package:crm_app/presentation/Views/Lead/business_profile.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class LeadHomeScreen extends StatelessWidget {
  const LeadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SavedProfile()),
                      );
                    },
                    child: Image.asset(
                      "assets/images/profile_pic.png",
                      width: 60,
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Morgan mills",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Good Morning",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        );
                      },
                      icon: Image.asset("assets/images/bell.png", width: 20),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),

            // Welcome Container
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 15, left: 15, bottom: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF80D050).withOpacity(0.2), // 20% opacity
                    Color(0xFF80D050).withOpacity(0.1), // 10% opacity
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '[Business Name]',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Gap(4),
                      Text(
                        'Set up your business to start hiring!',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Gap(12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BusinessProfile(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF80D050),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Complete Your Profile',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/lead_welcome.png',
                    height: 85,
                    width: 125,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),

            Gap(16),

            // Post a Job Container
            Stack(
              children: [
                // Main Container with background color
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color(0xFF80D050).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // Top left circle
                Positioned(
                  top: -60,
                  left: -50,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFFDFFFCC),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Bottom right circle
                Positioned(
                  bottom: -90,
                  right: -60,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFDFFFCC),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Text and button
                Positioned(
                  top: 15,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Post a Job to Become',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'a Client.',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Gap(4),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur.',
                        style: GoogleFonts.poppins(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Gap(7),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UploadPostScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF80D050),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Post a Job',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Speaker image positioned manually
                Positioned(
                  bottom: 15,
                  right: 0,
                  child: Image.asset('assets/images/speaker.png', width: 120),
                ),
              ],
            ),

            Gap(24),

            // Recent Jobs Heading
            Text(
              'Recent Jobs',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            Gap(20),

            // Job Cards Section 1
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
              onTap: () {},
            ),

            Gap(16),

            JobCard(
              width: double.infinity,
              logoPath: "assets/images/id_pic.png",
              companyName: "TECH CORP",
              timeAgo: "5hr Ago",
              jobTitle: "Software Engineer",
              tags: ["Full-Time", "Remote"],
              location: "Remote, United States",
              salary: "\$1.5k - 2k",
              isSaved: false,
              onApply: () {},
              onTap: () {},
            ),

            Gap(16),

            JobCard(
              width: double.infinity,
              logoPath: "assets/images/id_pic.png",
              companyName: "DESIGN STUDIO",
              timeAgo: "1 day Ago",
              jobTitle: "UX/UI Designer",
              tags: ["Part-Time", "Hybrid"],
              location: "5 miles away, NY 10001, New York",
              salary: "\$800 - 1.2k",
              isSaved: true,
              onApply: () {},
              onTap: () {},
            ),

            Gap(24),
          ],
        ),
      ),
    );
  }
}