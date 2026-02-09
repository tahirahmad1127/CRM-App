import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:file_picker/file_picker.dart';

class AddCertificationScreen extends StatefulWidget {
  const AddCertificationScreen({super.key});

  @override
  State<AddCertificationScreen> createState() => _AddCertificationScreenState();
}

class _AddCertificationScreenState extends State<AddCertificationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController providerController = TextEditingController();
  final TextEditingController issuedController = TextEditingController();
  String? selectedFileName;

  @override
  void dispose() {
    titleController.dispose();
    providerController.dispose();
    issuedController.dispose();
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
          'Add Certification',
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

              // Certification Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Certification Title',
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
                        hintText: 'e.g., Flutter Certified Developer',
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

              // Provider Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Provider',
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
                      controller: providerController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., Google',
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

              // Issued Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Issued Date',
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
                      controller: issuedController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., April 2023',
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

              // Upload Certificate
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Certificate',
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
                            'Tap to upload certificate',
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
                    'title': titleController.text.isNotEmpty ? titleController.text : 'New Certification',
                    'provider': providerController.text.isNotEmpty ? providerController.text : 'Provider',
                    'issued': issuedController.text.isNotEmpty ? issuedController.text : 'January 2024',
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