import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/step4_verification.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Step3Verification extends StatefulWidget {
  final String selectedRole; // Add this parameter

  const Step3Verification({
    super.key,
    required this.selectedRole, // Make it required
  });

  @override
  State<Step3Verification> createState() => _Step3VerificationState();
}

class _Step3VerificationState extends State<Step3Verification> {
  String? selectedRole;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
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
                    Center(
                      child: CommonImageView(
                        imagePath: 'assets/images/logo2.png',
                        height: 65,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ================= BODY (UNCHANGED) =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Select your Identity Verfication",
                        fontWeight: FontWeight.w600,
                        size: 24,
                        color: const Color(0xff0F0F0F),
                      ),
                      MyText(
                        text: "Sign in to your account by enter a\ngiven detail .",
                        fontWeight: FontWeight.w400,
                        size: 12,
                        color: const Color(0xff515151),
                      ),

                      Gap(screenHeight * 0.06),

                      /// Selection widget
                      buildSelectionWidget(
                        screenWidth: screenWidth,
                        label: "ID card verification",
                        isSelected: selectedRole == "ID card verification",
                        onTap: () {
                          setState(() {
                            if (selectedRole == "ID card verification") {
                              selectedRole = null; // Deselect
                            } else {
                              selectedRole = "ID card verification"; // Select
                            }
                            errorMessage = null;
                          });
                        },
                      ),

                      buildSelectionWidget(
                        screenWidth: screenWidth,
                        label: "Passport verification",
                        isSelected: selectedRole == "Passport verification",
                        onTap: () {
                          setState(() {
                            if (selectedRole == "Passport verification") {
                              selectedRole = null; // Deselect
                            } else {
                              selectedRole = "Passport verification"; // Select
                            }
                            errorMessage = null;
                          });
                        },
                      ),

                      if (errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            errorMessage!,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      Gap(screenHeight * 0.15),
                      MyContainer(
                        onTap: () {
                          if (selectedRole == null) {
                            setState(() {
                              errorMessage =
                              "Please select a verification method to continue.";
                            });
                          } else {
                            setState(() {
                              errorMessage = null;
                            });

                            // Pass the user role to Step4Verification
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Step4Verification(selectedRole: widget.selectedRole),
                              ),
                            );
                          }
                        },
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 30),
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: FrontendConfigs.kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: FrontendConfigs.kScaffoldBackgroundColor,
                              fontWeight: FontWeight.w600,
                            ),
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
      ),
    );
  }

  /// Selection Widget
  Widget buildSelectionWidget({
    required double screenWidth,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return MyContainer(
      onTap: onTap,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? FrontendConfigs.kPrimaryColor // ✅ selected border
              : Colors.transparent, // normal border
          width: 0.6,
        ),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffF5F5F5),
      ),
      child: Row(
        children: [
          CommonImageView(
            height: 26,
            svgColor:
            isSelected ? FrontendConfigs.kPrimaryColor : const Color(0xff515151),
          ),
          Gap(screenWidth * 0.03),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? FrontendConfigs.kPrimaryColor : const Color(0xff515151),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              CupertinoIcons.arrow_right,
              size: 20,
              color: Color(0xff515151),
            ),
          ),
        ],
      ),
    );
  }
}