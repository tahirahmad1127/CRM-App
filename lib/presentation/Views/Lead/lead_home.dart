import 'package:crm_app/presentation/Views/Lead/business_profile.dart';
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
                  Image.asset("assets/images/profile_pic.png", width: 60),
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
                      onPressed: () {},
                      icon: Image.asset("assets/images/bell.png",
                        width: 20,
                      ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessProfile()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  Image.asset('assets/images/lead_welcome.png',
                    height: 85,
                    width: 125,
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),

            Gap(16),

            // Post a Job Container
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
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  bottom: 15,  // Adjust this value
                  right:0,   // Adjust this value
                  child: Image.asset(
                    'assets/images/speaker.png',
                    width: 120,
                  ),
                ),
              ],
            ),

            Gap(24),

            // Explore Features




            // Features Grid Container with Shadow
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Features',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Gap(20),
                  // First Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFeatureItem('Post Job', 'assets/images/post_job.png'),
                      _buildFeatureItem('Manage Workers', 'assets/images/manage_workers.png'),
                      _buildFeatureItem('Track Hours', 'assets/images/track_hours.png'),
                    ],
                  ),
                  Gap(24),
                  // Second Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFeatureItem('Payments', 'assets/images/payments.png'),
                      _buildFeatureItem('Settings', 'assets/images/settings.png'),
                      SizedBox(width: 70), // Empty space for alignment
                    ],
                  ),
                ],
              ),
            ),

            Gap(24),

            // Upgrade to Client Button
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF80D050),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Upgrade to Client',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Gap(24),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        assetPath,
                        width: 40,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                      width: 70,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}