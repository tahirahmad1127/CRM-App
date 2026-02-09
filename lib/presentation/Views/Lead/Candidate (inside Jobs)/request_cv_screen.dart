import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class RequestCVScreen extends StatefulWidget {
  const RequestCVScreen({super.key});

  @override
  State<RequestCVScreen> createState() => _RequestCVScreenState();
}

class _RequestCVScreenState extends State<RequestCVScreen> {
  final TextEditingController numberOfCVsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    numberOfCVsController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Request CV",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),

            // Number of CVs
            MyText(
              text: "No of CV's",
              fontWeight: FontWeight.w500,
              color: const Color(0xff000000),
            ),
            Gap(screenHeight * 0.01),
            MyTextField(
              height: 56,
              controller: numberOfCVsController,
              hintText: "Enter number of CVs",
              keyboardType: TextInputType.number,
              textInputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),

            Gap(screenHeight * 0.02),

            // Description
            MyText(
              text: "Description",
              fontWeight: FontWeight.w500,
              color: const Color(0xff000000),
            ),
            Gap(screenHeight * 0.01),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffE0E0E0),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: 6,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter description",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9E9E9E),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            Gap(screenHeight * 0.05),

            // Submit Button
            MyContainer(
              onTap: () {
                // Handle submit logic here
                // You can add validation and API call
                Navigator.pop(context);
              },
              alignment: Alignment.center,
              height: screenHeight * 0.07,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: FrontendConfigs.kPrimaryColor,
              ),
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: FrontendConfigs.kScaffoldBackgroundColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Gap(20),
          ],
        ),
      ),
    );
  }
}