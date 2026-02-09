import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:file_picker/file_picker.dart';

class AddQualificationScreen extends StatefulWidget {
  const AddQualificationScreen({super.key});

  @override
  State<AddQualificationScreen> createState() => _AddQualificationScreenState();
}

class _AddQualificationScreenState extends State<AddQualificationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  String? selectedFileName;

  @override
  void dispose() {
    titleController.dispose();
    institutionController.dispose();
    yearController.dispose();
    super.dispose();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    );

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
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
          'Add Qualification',
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

              // Qualification Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Qualification Title',
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
                        hintText: 'e.g., Bachelor of Computer Science',
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

              // Institution Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Institution',
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
                      controller: institutionController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., Stanford University',
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

              // Year
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Year',
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
                      controller: yearController,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., 2020',
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

              // Upload Document
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Document',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  Gap(8),
                  GestureDetector(
                    onTap: pickFile,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xff959595), width: 0.6),
                      ),
                      child: selectedFileName != null
                          ? Row(
                        children: [
                          Gap(12),
                          Image.asset(
                            'assets/images/pdf_icon.png',
                            width: 40,
                            height: 40,
                          ),
                          Gap(12),
                          Expanded(
                            child: Text(
                              selectedFileName!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedFileName = null;
                              });
                            },
                          ),
                        ],
                      )
                          : Row(
                        children: [
                          IconButton(
                            onPressed: pickFile,
                            icon: Image.asset(
                              'assets/images/leads_upload.png',
                              width: 80,
                            ),
                          ),
                          Text(
                            'Tap to upload document',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                        ],
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
                    'title': titleController.text.isNotEmpty ? titleController.text : 'New Qualification',
                    'institution': institutionController.text.isNotEmpty ? institutionController.text : 'Institution',
                    'year': yearController.text.isNotEmpty ? yearController.text : '2024',
                    'image': 'assets/images/pdf_icon.png',
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