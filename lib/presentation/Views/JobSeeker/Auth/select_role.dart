import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/login_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/signup_screen.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_button.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({super.key});

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  String? selectedRole;
  String? errorMessage;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: CommonImageView(
                    imagePath: 'assets/images/logo2.png',
                    height: 65,
                  ),
                ),
              ),
              MyText(
                text: "Role Selection",
                fontWeight: FontWeight.w600,
                size: 24,
                color: Color(0xff0F0F0F),
              ),
              MyText(
                text:
                "Select your role below so we can\npersonalize your experience.",
                fontWeight: FontWeight.w400,
                size: 12,
                color: Color(0xff515151),
              ),

              Gap(screenHeight * 0.06),

              /// Selection widget
              buildSelectionWidget(
                screenWidth: screenWidth,
                iconPath: "assets/images/job_icon.png",
                label: "Job Seeker/Looking for Work",
                isSelected: selectedRole == "Job Seeker",
                onTap: () {
                  setState(() {
                    if (selectedRole == "Job Seeker") {
                      selectedRole = null;   // Deselect
                    } else {
                      selectedRole = "Job Seeker"; // Select
                    }
                    errorMessage = null;
                  });
                },

              ),


              buildSelectionWidget(
                screenWidth: screenWidth,
                iconPath: "assets/images/third_icon.png",
                label: "Employer/Looking for Workers",
                isSelected: selectedRole == "Employer",
                onTap: () {
                  setState(() {
                    if (selectedRole == "Employer") {
                      selectedRole = null;   // Deselect
                    } else {
                      selectedRole = "Employer"; // Select
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
              Spacer(),
              MyContainer(
                onTap: () {
                  if (selectedRole == null) {
                    setState(() {
                      errorMessage = "Please select a role to continue.";
                    });
                  } else {
                    setState(() {
                      errorMessage = null;
                    });

                    // Pass selectedRole to SignupScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(selectedRole: selectedRole!),
                      ),
                    );
                  }
                },
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 30),
                height: screenHeight * 0.07,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: FrontendConfigs.kPrimaryColor,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Continue",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: FrontendConfigs.kScaffoldBackgroundColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.06),
                        child: Icon(
                          Icons.arrow_forward,
                          color: FrontendConfigs.kScaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  /// Selection Widget
  Widget buildSelectionWidget({
    required double screenWidth,
    required String iconPath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return MyContainer(
      onTap: onTap,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? FrontendConfigs.kPrimaryColor   // ✅ selected border
              : Color(0xff6B6B6B),              // normal border
          width: 0.6,
        ),
        borderRadius: BorderRadius.circular(6),
        color: FrontendConfigs.kWhiteColor,
      ),
      child: Row(
        children: [
          CommonImageView(
            imagePath: iconPath,
            height: 26,
            svgColor: isSelected
                ? FrontendConfigs.kPrimaryColor
                : Color(0xff515151),
          ),
          Gap(screenWidth * 0.03),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? FrontendConfigs.kPrimaryColor
                    : Color(0xff515151),
              ),
            ),
          ),
          Icon(
            CupertinoIcons.arrow_right,
            color: isSelected
                ? FrontendConfigs.kPrimaryColor
                : Color(0xff515151),
          ),
        ],
      ),
    );
  }
}