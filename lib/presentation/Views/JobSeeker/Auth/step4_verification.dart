import 'dart:io';

import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/code_verification_screen.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_button.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Step4Verification extends StatefulWidget {
  const Step4Verification({super.key});

  @override
  State<Step4Verification> createState() => _Step4VerificationState();
}

class _Step4VerificationState extends State<Step4Verification> {
  String? selectedRole;
  String? errorMessage;
  File? selectedImage;
  File? selectedImage2;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController addressController = TextEditingController();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        errorMessage = null; // Clear error when image is selected
      });
    }
  }

  Future<void> pickSecondImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        selectedImage2 = File(image.path);
        errorMessage = null; // Clear error when image is selected
      });
    }
  }

  void validateAndNavigate() {
    if (selectedImage == null) {
      setState(() {
        errorMessage = "Please select Front pic to continue.";
      });
      return;
    }

    if (selectedImage2 == null) {
      setState(() {
        errorMessage = "Please select Back pic to continue.";
      });
      return;
    }

    // If both images are selected
    setState(() {
      errorMessage = null;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CodeVerificationScreen()),
    );
  }

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
                text: "Upload ID Card Image",
                fontWeight: FontWeight.w600,
                size: 24,
                color: Color(0xff0F0F0F),
              ),
              MyText(
                text: "Upload front and back side of your id card.",
                fontWeight: FontWeight.w400,
                size: 12,
                color: Color(0xff515151),
              ),

              Gap(screenHeight * 0.06),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: screenWidth * 0.40,
                      height: screenHeight * 0.17,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xff9A9A9A),
                          width: 0.4,
                        ),
                        image: selectedImage != null
                            ? DecorationImage(
                                image: FileImage(selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: selectedImage == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/camera2.png",
                                  width: 35,
                                ),
                                MyText(
                                  text: "Front",
                                  fontWeight: FontWeight.w700,
                                  size: 16,
                                  color: Color(0xff000000),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                  GestureDetector(
                    onTap: pickSecondImage,
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.17,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xff9A9A9A),
                          width: 0.4,
                        ),
                        image: selectedImage2 != null
                            ? DecorationImage(
                                image: FileImage(selectedImage2!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: selectedImage2 == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/camera2.png",
                                  width: 35,
                                ),
                                MyText(
                                  text: "Back",
                                  fontWeight: FontWeight.w700,
                                  size: 16,
                                  color: Color(0xff000000),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                ],
              ),

              // Error message display
              if (errorMessage != null) ...[
                Gap(16),
                Center(
                  child: Text(
                    errorMessage!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],

              Gap(screenHeight * 0.10),
              MyContainer(
                onTap: validateAndNavigate,
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
}
