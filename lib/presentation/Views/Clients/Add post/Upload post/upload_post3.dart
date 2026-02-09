import 'package:crm_app/presentation/Views/Lead/lead_bottom_bar.dart';
import 'package:crm_app/presentation/Views/Lead/Bottom_Bar%20Screens/lead_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class UploadPost3Screen extends StatefulWidget {
  const UploadPost3Screen({super.key});

  @override
  State<UploadPost3Screen> createState() => _UploadPost3ScreenState();
}

class _UploadPost3ScreenState extends State<UploadPost3Screen> {
  int currentStep = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Post a Job',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(8),

              // Step Progress Indicator
              Stack(
                children: [
                  // Lines behind circles - centered vertically
                  Positioned(
                    top: 7.5,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        SizedBox(width: 12.5),
                        Expanded(
                          child: Container(
                            height: 10,
                            color: currentStep > 1
                                ? Color(0xFF80D050)
                                : Color(0xFFE0E0E0),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 10,
                            color: currentStep > 2
                                ? Color(0xFF80D050)
                                : Color(0xFFE0E0E0),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 10,
                            color: currentStep > 3
                                ? Color(0xFF80D050)
                                : Color(0xFFE0E0E0),
                          ),
                        ),
                        SizedBox(width: 12.5),
                      ],
                    ),
                  ),
                  // Step indicators on top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStepIndicator(1, 'Step 1'),
                      _buildStepIndicator(2, 'Step 2'),
                      _buildStepIndicator(3, 'Step 3'),
                      _buildStepIndicator(4, 'Step 4'),
                    ],
                  ),
                ],
              ),

              Gap(24),

              // Step 1
              Text(
                'Step 1',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Gap(12),
              _buildInfoRow('Job Title:', 'Senior Industrial Manager'),
              Gap(8),
              _buildInfoRow('Category:', 'Management'),
              Gap(8),
              _buildInfoText(
                'Description:',
                'Lorem ipsum dolor sit amet, consectetur. At feugiat in ipsum ipsum donec justo.',
              ),

              Gap(24),

              // Step 2
              Text(
                'Step 2',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Gap(12),
              Text(
                'Skills',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6B6B6B),
                ),
              ),
              Gap(8),
              Row(
                children: [
                  _buildSkillChip('Management'),
                  Gap(8),
                  _buildSkillChip('Communication Skill'),
                ],
              ),
              Gap(12),
              _buildInfoRow('Experience:', '+2 Years'),
              Gap(8),
              _buildInfoRow('Certificates:', 'Managments'),

              Gap(24),

              // Step 3
              Text(
                'Step 3',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Gap(12),
              _buildInfoRow('Salary:', '\$10.00 per/hr'),
              Gap(8),
              _buildInfoRow('Timing:', '9:00 AM - 5:00 PM'),
              Gap(8),
              _buildInfoRow('Location:', '11 miles away, GA 30326, Atlanta'),

              Gap(56),

              GestureDetector(
                onTap: () {
                  // Show popup when pressed
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        insetPadding: EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Publish Confirmation',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Are you sure you want to publish this item?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context); // Close popup
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LeadBottomBar(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF80D050),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Publish',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFF80D050),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Publish',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Gap(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int step, String label) {
    bool isCompleted = currentStep > step;
    bool isCurrent = currentStep == step;
    return Column(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: (isCompleted || isCurrent)
                ? Color(0xFF80D050)
                : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: (isCompleted || isCurrent)
                  ? Color(0xFF80D050)
                  : Color(0xFFE0E0E0),
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? Icon(Icons.check, color: Colors.white, size: 16)
                : Text(
                    '',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
          ),
        ),
        Gap(4),
        Gap(4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          TextSpan(
            text: ' $value',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$label ",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xff6B6B6B),
            ),
          ),
          TextSpan(
            text: value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xff6B6B6B),
            ),
          ),
        ],
      ),
      softWrap: true,
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        skill,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff6B6B6B),
        ),
      ),
    );
  }
}
