import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class UploadPost1Screen extends StatefulWidget {
  const UploadPost1Screen({super.key});

  @override
  State<UploadPost1Screen> createState() => _UploadPost1ScreenState();
}

class _UploadPost1ScreenState extends State<UploadPost1Screen> {
  int currentStep = 3;
  String? selectedCategory;
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  SfRangeValues experienceYears = SfRangeValues(1.0, 5.0);

  // Skills
  List<String> selectedSkills = [];
  final List<String> availableSkills = ['Management', 'Communication Skill'];

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

            // Skills Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skills',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff959595), width: 0.6),
                  ),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: availableSkills.map((skill) {
                      bool isSelected = selectedSkills.contains(skill);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedSkills.remove(skill);
                            } else {
                              selectedSkills.add(skill);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
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
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            Gap(24),

            // Experience Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                SfRangeSlider(
                  min: 0.0,
                  max: 10.0,
                  values: experienceYears,
                  showTicks: false,
                  showLabels: false,
                  inactiveColor: const Color(0xFFDEFFCB),
                  activeColor: const Color(0xFF80D050),
                  enableTooltip: true,
                  tooltipShape: SfPaddleTooltipShape(),
                  onChanged: (SfRangeValues newValues) {
                    setState(() {
                      experienceYears = newValues;
                    });
                  },
                ),
                Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF80D050),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${experienceYears.start.toInt()} year',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF80D050),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${experienceYears.end.toInt()} year',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Gap(24),

            // Certificates Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Certificates',
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
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            print('Image selected: ${image.path}');
                          }
                        },
                        icon: Image.asset('assets/images/upload_leads2.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Gap(80),
            // Next Button
            GestureDetector(
              onTap: () {
                if (currentStep < 4) {
                  setState(() {
                    currentStep++;
                  });
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadPost2Screen()),
                );
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
}
