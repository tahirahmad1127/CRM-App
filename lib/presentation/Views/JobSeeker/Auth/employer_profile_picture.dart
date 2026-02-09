import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/step3_verification.dart';
import 'package:crm_app/presentation/Views/JobSeeker/professional%20details/professional%20details.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EmployerProfilePicture extends StatefulWidget {
  final String selectedRole;

  const EmployerProfilePicture({
    super.key,
    required this.selectedRole,
  });

  @override
  State<EmployerProfilePicture> createState() => _EmployerProfilePictureState();
}

class _EmployerProfilePictureState extends State<EmployerProfilePicture> {

  File? selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyAddressController = TextEditingController();
  final TextEditingController companyRegistrationNumberController = TextEditingController();
  final TextEditingController alternateContactNameController = TextEditingController();
  final TextEditingController alternateContactPhoneController = TextEditingController();
  final TextEditingController alternateContactEmailController = TextEditingController();

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

                      /// Company Logo
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
                          "Company Logo",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const Gap(20),

                      /// Company Name
                      MyText(
                        text: "Company Name",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: companyNameController,
                        hintText: "Enter company name",
                        keyboardType: TextInputType.name,
                      ),

                      Gap(screenHeight * 0.02),

                      /// Company Address
                      MyText(
                        text: "Company Address",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: companyAddressController,
                        hintText: "Enter company address",
                        keyboardType: TextInputType.streetAddress,
                      ),

                      Gap(screenHeight * 0.02),

                      /// Company Registration Number
                      MyText(
                        text: "Company Registration Number",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),


                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: companyRegistrationNumberController,
                        hintText: "Enter registration number",
                        keyboardType: TextInputType.text,
                      ),

                      Gap(screenHeight * 0.03),

                      /// Alternate Contact Person Details Heading
                      MyText(
                        text: "Alternate Contact Person Details",
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff000000),
                        size: 16,
                      ),

                      Gap(screenHeight * 0.02),

                      /// Alternate Contact Name
                      MyText(
                        text: "Name",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: alternateContactNameController,
                        hintText: "Enter contact person name",
                        keyboardType: TextInputType.name,
                      ),

                      Gap(screenHeight * 0.02),

                      /// Alternate Contact Phone
                      MyText(
                        text: "Phone",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: alternateContactPhoneController,
                        hintText: "Enter phone number",
                        keyboardType: TextInputType.phone,
                      ),

                      Gap(screenHeight * 0.02),

                      /// Alternate Contact Email
                      MyText(
                        text: "Email",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: alternateContactEmailController,
                        hintText: "Enter email address",
                        keyboardType: TextInputType.emailAddress,
                      ),

                      Gap(screenHeight * 0.07),

                      /// Next Button - Both roles go to ProfessionalDetails
                      MyContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Step3Verification(selectedRole: widget.selectedRole),
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
                            color: FrontendConfigs.kScaffoldBackgroundColor,
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