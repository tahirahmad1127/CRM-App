import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({super.key});

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  int currentStep = 2;
  String? selectedCategory;
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> categories = [
    'Technology',
    'Healthcare',
    'Education',
    'Finance',
    'Marketing',
    'Sales',
  ];

  @override
  void dispose() {
    jobTitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
      body: Padding(
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
                  top: 7.5, // Adjusted to center 10px line: (25 - 10) / 2 = 7.5
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      SizedBox(width: 12.5), // Half of circle width to start line from center
                      Expanded(
                        child: Container(
                          height: 10,
                          color: currentStep > 1 ? Color(0xFF80D050) : Color(0xFFE0E0E0),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          color: currentStep > 2 ? Color(0xFF80D050) : Color(0xFFE0E0E0),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          color: currentStep > 3 ? Color(0xFF80D050) : Color(0xFFE0E0E0),
                        ),
                      ),
                      SizedBox(width: 12.5), // Half of circle width to end line at center
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

            // Job Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job Title',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff959595), width: 0.6),
                  ),
                  child: TextField(
                    controller: jobTitleController,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Senior Industrial Manager',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),

            Gap(16),

            // Category Dropdown
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff959595), width: 0.6),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(
                        'Category',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B6B6B),
                        ),
                      ),
                      value: selectedCategory,
                      icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff6B6B6B)),
                      items: categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            Gap(16),

            // Description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff959595), width: 0.6),
                  ),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type here...',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),

            Gap(50),
            // Next Button
            GestureDetector(
              onTap: () {
                if (currentStep < 4) {
                  setState(() {
                    currentStep++;
                  });
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPost1Screen()));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF80D050),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
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
            color: Color(0xFF80D050),
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFF80D050),
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
        Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        ),
      ],
    );
  }
}