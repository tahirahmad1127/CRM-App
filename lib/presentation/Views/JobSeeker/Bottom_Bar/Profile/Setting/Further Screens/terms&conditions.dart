import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,

        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Gap(10),
            Text(
              'Last updated: January 28, 2026',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff6B6B6B),
              ),
            ),
            Gap(20),
            _buildSection(
              'Acceptance of Terms',
              'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
            ),
            Gap(16),
            _buildSection(
              'Use License',
              'Permission is granted to temporarily download one copy of the materials on our application for personal, non-commercial transitory viewing only.',
            ),
            Gap(16),
            _buildSection(
              'User Account',
              'You are responsible for:\n• Maintaining the confidentiality of your account\n• All activities that occur under your account\n• Notifying us immediately of any unauthorized use',
            ),
            Gap(16),
            _buildSection(
              'Prohibited Activities',
              'You may not:\n• Use the application for any illegal purpose\n• Attempt to gain unauthorized access to any portion of the application\n• Interfere with or disrupt the application or servers\n• Transmit any viruses or malicious code',
            ),
            Gap(16),
            _buildSection(
              'Disclaimer',
              'The materials on our application are provided on an "as is" basis. We make no warranties, expressed or implied, and hereby disclaim all warranties.',
            ),
            Gap(16),
            _buildSection(
              'Limitations',
              'In no event shall our company or its suppliers be liable for any damages arising out of the use or inability to use the materials on our application.',
            ),
            Gap(16),
            _buildSection(
              'Modifications',
              'We may revise these terms of service at any time without notice. By using this application, you are agreeing to be bound by the current version of these terms.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Gap(8),
        Text(
          content,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff515151),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}