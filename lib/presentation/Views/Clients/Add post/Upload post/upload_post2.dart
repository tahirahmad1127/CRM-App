import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class UploadPost2Screen extends StatefulWidget {
  const UploadPost2Screen({super.key});

  @override
  State<UploadPost2Screen> createState() => _UploadPost2ScreenState();
}

class _UploadPost2ScreenState extends State<UploadPost2Screen> {
  int currentStep = 4;
  final TextEditingController salaryController = TextEditingController(text: '20.00');
  String salaryType = 'Hourly';
  TimeOfDay shiftStart = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay shiftEnd = TimeOfDay(hour: 9, minute: 0);
  final TextEditingController locationController = TextEditingController(text: '11 miles away, GA 30326, Atlanta');

  @override
  void dispose() {
    salaryController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? shiftStart : shiftEnd,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF80D050),
            colorScheme: ColorScheme.light(
              primary: Color(0xFF80D050),
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          shiftStart = picked;
        } else {
          shiftEnd = picked;
        }
      });
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute$period';
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

              // Salary Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Salary',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  Gap(8),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff959595), width: 0.6),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '\$',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff515151),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: salaryController,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff515151),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: salaryType,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                  color: Color(0xFF6B6B6B),
                                ),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff515151),
                                ),
                                dropdownColor: const Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(6),
                                items: ["Hourly", "Daily", "Weekly", "Monthly", "Yearly"]
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: const Color(0xff6B6B6B),
                                      ),
                                    ),
                                  ),
                                )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      salaryType = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Gap(15),

              // Shift Start and End Section
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shift Start',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6B6B6B),
                          ),
                        ),
                        Gap(8),
                        GestureDetector(
                          onTap: () => _selectTime(context, true),
                          child: Container(
                            height: 56,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xff959595), width: 0.6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _formatTimeOfDay(shiftStart),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff6B6B6B),
                                  ),
                                ),
                                Icon(
                                  Icons.access_time,
                                  color: Color(0xFF80D050),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shift End',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6B6B6B),
                          ),
                        ),
                        Gap(8),
                        GestureDetector(
                          onTap: () => _selectTime(context, false),
                          child: Container(
                            height: 56,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xff959595), width: 0.6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _formatTimeOfDay(shiftEnd),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff6B6B6B),
                                  ),
                                ),
                                Icon(
                                  Icons.access_time,
                                  color: Color(0xFF80D050),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Gap(24),

              // Location Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  Gap(8),
                  Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff959595), width: 0.6),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/maps.png',
                          width: 45,
                        ),
                        Gap(8),
                        Expanded(
                          child: TextField(
                            controller: locationController,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6B6B6B),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadPost3Screen()));

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
            color: (isCompleted || isCurrent) ? Color(0xFF80D050) : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: (isCompleted || isCurrent) ? Color(0xFF80D050) : Color(0xFFE0E0E0),
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