import 'dart:io';

import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/bottom_bar_screen.dart';
import 'package:crm_app/presentation/Views/Lead/lead_bottom_bar.dart';
import 'package:crm_app/presentation/Views/Lead/lead_home.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_button.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_pin_code.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CodeVerificationScreen extends StatefulWidget {
  final String selectedRole; // Add this parameter

  const CodeVerificationScreen({
    super.key,
    required this.selectedRole, // Make it required
  });

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER (FULL WIDTH) =================
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: SizedBox(
                height: 65,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.arrow_left),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ================= BODY (UNCHANGED) =================
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Verification Code",
                        fontWeight: FontWeight.w600,
                        size: 24,
                        color: Color(0xff0F0F0F),
                      ),
                      MyText(
                        text:
                        "We send verification code on your\nexa.......@gmail.com",
                        fontWeight: FontWeight.w400,
                        size: 12,
                        color: Color(0xff515151),
                      ),

                      Gap(screenHeight * 0.06),

                      MyContainer(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.5,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff9A9A9A), width: 0.4),
                        child: Column(
                          children: [
                            Gap(screenHeight * 0.05),

                            Image.asset(
                              "assets/images/verification_password.png",
                              width: 91,
                              height: 56,
                            ),
                            Gap(screenHeight * 0.03),
                            MyText(
                              text: "Verify your account",
                              size: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000),
                            ),
                            Gap(screenHeight * 0.03),
                            MyPinCode(
                              length: 6,
                              controller: otpController,
                              onCompleted: (value) {
                                print('OTP Entered: $value');
                                // Verify OTP here
                              },
                              onChanged: (value) {
                                print('Current: $value');
                              },
                            ),
                            Gap(screenHeight * 0.03),
                            MyContainer(
                              onTap: () {
                                // Navigate based on selected role
                                if (widget.selectedRole == "Job Seeker") {
                                  // Navigate to Job Seeker home screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomBar(),
                                    ),
                                  );
                                } else if (widget.selectedRole == "Employer") {
                                  // Navigate to Employer home screen (LeadHomeScreen)
                                  // Replace BottomBar() with LeadHomeScreen() or your employer screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LeadBottomBar(), // Replace with LeadHomeScreen()
                                    ),
                                  );
                                }
                              },
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 30),
                              height: screenHeight * 0.07,
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: FrontendConfigs.kPrimaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: FrontendConfigs.kScaffoldBackgroundColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: "45 seconds to",
                                    fontWeight: FontWeight.w400,
                                    size: 14,
                                    color: Color(0xff000000),
                                  ),
                                  Gap(5),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Resend code?',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Color(0xff1F1F1F),
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xff1F1F1F),
                                        decorationThickness: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenHeight * 0.10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}