import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/step3_verification.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  final String selectedRole; // Add this parameter

  const ProfilePicture({
    super.key,
    required this.selectedRole, // Make it required
  });

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  DateTime? selectedBirthDate;
  DateTime? selectedDate;

  File? selectedImage;
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER =================
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

            /// ================= BODY =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Gap(10),

                      /// Profile Image
                      Center(
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xffE0E0E0),
                              image: selectedImage != null
                                  ? DecorationImage(
                                image: FileImage(selectedImage!),
                                fit: BoxFit.cover,
                              )
                                  : null,
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/camera1.png",
                                width: 46,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Gap(10),

                      Center(
                        child: Text(
                          "Profile Photo",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const Gap(20),

                      /// Address
                      MyText(
                        text: "Full Address",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: addressController,
                        hintText: "New Jersey, USA",
                        keyboardType: TextInputType.name,
                      ),

                      Gap(screenHeight * 0.02),

                      /// Date of Birth
                      MyText(
                        text: "Date of Birth",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),

                      GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                            });
                          }
                        },
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.black, width: 0.6),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  selectedDate == null
                                      ? 'MM/DD/YYYY'
                                      : DateFormat('MM/dd/yyyy')
                                      .format(selectedDate!),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff515151),
                                  ),
                                ),
                              ),
                              Image.asset(
                                "assets/images/calender.png",
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Gap(screenHeight * 0.07),

                      /// Next Button
                      MyContainer(
                        onTap: () {
                          // Pass the role to Step3Verification
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Step3Verification(selectedRole: widget.selectedRole),
                            ),
                          );
                        },
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 15),
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: FrontendConfigs.kPrimaryColor,
                        ),
                        child: Text(
                          "Next",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: FrontendConfigs
                                .kScaffoldBackgroundColor,
                            fontWeight: FontWeight.w600,
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
}