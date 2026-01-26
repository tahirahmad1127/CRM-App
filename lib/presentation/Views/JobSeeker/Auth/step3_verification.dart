import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/step4_verification.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_button.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Step3Verification extends StatefulWidget {
  const Step3Verification({super.key});

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
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(CupertinoIcons.arrow_left),
                      ),
                    ),
                    CommonImageView(
                      imagePath: 'assets/images/logo2.png',
                      height: 65,
                    ),
                  ],
                ),
              ),
              MyText(
                text: "Select you Identity Verfication",
                fontWeight: FontWeight.w600,
                size: 24,
                color: Color(0xff0F0F0F),
              ),
              MyText(
                text: "Sign in to your account by enter a\ngiven detail .",
                fontWeight: FontWeight.w400,
                size: 12,
                color: Color(0xff515151),
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
              Gap(screenHeight * 0.10),
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

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Step4Verification(),
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
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? FrontendConfigs
                    .kPrimaryColor // ✅ selected border
              : Colors.transparent, // normal border
          width: 0.6,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffF5F5F5),
      ),
      child: Row(
        children: [
          CommonImageView(
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
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? FrontendConfigs.kPrimaryColor
                    : Color(0xff515151),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              CupertinoIcons.arrow_right,
              size: 20,
              color: isSelected
                  ? FrontendConfigs.kPrimaryColor
                  : Color(0xff515151),
            ),
          ),
        ],
      ),
    );
  }
}
