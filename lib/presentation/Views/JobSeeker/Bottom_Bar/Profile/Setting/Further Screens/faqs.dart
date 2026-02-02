import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:accordion/accordion.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I create an account?',
      'answer':
      'To create an account, click on the "Sign Up" button on the home screen. Fill in your personal information, upload your resume, and complete the registration process. You will receive a confirmation email once your account is created.',
    },
    {
      'question': 'How can I apply for a job?',
      'answer':
      'Browse through the available job listings on the Jobs tab. Click on any job to view details, then tap the "Apply Now" button. Fill in the required information and submit your application. You can track your application status in the Applications section.',
    },
    {
      'question': 'Can I edit my profile after creating it?',
      'answer':
      'Yes, you can edit your profile anytime. Go to the Profile tab and tap on "Edit Profile". You can update your personal information, skills, documents, and preferences whenever needed.',
    },
    {
      'question': 'How do I upload documents?',
      'answer':
      'Navigate to your Profile page and scroll down to the Documents section. Tap on "+ Upload Document" and select the file from your device. Supported formats include PDF, DOC, and DOCX.',
    },
    {
      'question': 'What should I do if I forget my password?',
      'answer':
      'On the login screen, tap on "Forgot Password?". Enter your registered email address, and you will receive a password reset link. Follow the instructions in the email to create a new password.',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'FAQs',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      // ✅ Use ListView instead of SingleChildScrollView
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Frequently Asked Questions',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Gap(10),
          Text(
            'Find answers to common questions below',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xff6B6B6B),
            ),
          ),
          const Gap(20),
          Container(
            width: double.infinity,
            child: Accordion(
              maxOpenSections: 1,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerBackgroundColorOpened: FrontendConfigs.kPrimaryColor,
              headerPadding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 15),
              paddingListTop: 0,
              paddingListBottom: 0,
              paddingListHorizontal: 0,
              children: faqs.map((faq) {
                return AccordionSection(
                  isOpen: false,
                  headerBackgroundColor: const Color(0xffF5F5F5),
                  headerBackgroundColorOpened: FrontendConfigs.kPrimaryColor,
                  contentBorderColor: FrontendConfigs.kPrimaryColor,
                  contentBackgroundColor: Colors.white,
                  header: Text(
                    faq['question']!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  content: Text(
                    faq['answer']!,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff515151),
                      height: 1.5,
                    ),
                  ),
                  contentHorizontalPadding: 15,
                  contentVerticalPadding: 15,
                  contentBorderWidth: 1,
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20), // extra space at the bottom
        ],
      ),
    );
  }
}
