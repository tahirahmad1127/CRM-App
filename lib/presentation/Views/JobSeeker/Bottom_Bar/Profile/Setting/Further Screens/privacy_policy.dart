import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Privacy Policy',
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
              'Privacy Policy',
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
              'Introduction',
              'We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our application.',
            ),
            Gap(16),
            _buildSection(
              'Information We Collect',
              'We collect information that you provide directly to us, including your name, email address, phone number, resume, and other professional information you choose to share.',
            ),
            Gap(16),
            _buildSection(
              'How We Use Your Information',
              'We use the information we collect to:\n• Provide and maintain our services\n• Notify you about changes to our services\n• Allow you to participate in interactive features\n• Provide customer support\n• Monitor the usage of our service',
            ),
            Gap(16),
            _buildSection(
              'Data Security',
              'We implement appropriate security measures to protect your personal information. However, no method of transmission over the internet is 100% secure.',
            ),
            Gap(16),
            _buildSection(
              'Your Rights',
              'You have the right to access, update, or delete your personal information at any time. You can do this through your account settings or by contacting us.',
            ),
            Gap(16),
            _buildSection(
              'Contact Us',
              'If you have any questions about this Privacy Policy, please contact us through the Contact Us section in Settings.',
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