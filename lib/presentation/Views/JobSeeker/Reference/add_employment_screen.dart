import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class AddEmploymentScreen extends StatefulWidget {
  const AddEmploymentScreen({super.key});

  @override
  State<AddEmploymentScreen> createState() => _AddEmploymentScreenState();
}

class _AddEmploymentScreenState extends State<AddEmploymentScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    durationController.dispose();
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
          'Add Employment',
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
                      controller: titleController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., Senior Software Engineer | Company Name',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B6B6B),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(16),

              // Duration
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration',
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
                      controller: durationController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., January 2023 - Present',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B6B6B),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(16),

              // Job Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job Description',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  Gap(8),
                  Container(
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
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText:
                        'Describe your role and responsibilities...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B6B6B),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(40),

              // Save Button
              GestureDetector(
                onTap: () {
                  // Return data to previous screen
                  Navigator.pop(context, {
                    'title': titleController.text.isNotEmpty
                        ? titleController.text
                        : 'New Position | Company',
                    'duration': durationController.text.isNotEmpty
                        ? durationController.text
                        : 'January 2024 - Present',
                    'description': descriptionController.text.isNotEmpty
                        ? descriptionController.text
                        : 'Job description not provided.',
                    'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
                  });
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
                      'Save',
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
}