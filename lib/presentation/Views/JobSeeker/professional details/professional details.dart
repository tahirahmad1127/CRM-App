import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Offered/Pdf%20Viewer/pdf_viewer.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Reference/employment_history.dart';
import 'package:crm_app/presentation/Views/JobSeeker/professional%20details/add_certifications.dart';
import 'package:crm_app/presentation/Views/JobSeeker/professional%20details/add_qualification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class ProfessionalDetails extends StatefulWidget {
  final String selectedRole;

  const ProfessionalDetails({
    super.key,
    required this.selectedRole,
  });

  @override
  State<ProfessionalDetails> createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetails> {
  String? selectedExperience;
  final List<String> experienceOptions = [
    'Entry Level (0-1 years)',
    'Junior (1-3 years)',
    'Mid-Level (3-5 years)',
    'Senior (5-8 years)',
    'Expert (8+ years)',
  ];

  // Dummy data for qualifications
  List<Map<String, String>> qualifications = [
    {
      'title': 'Bachelor of Computer Science',
      'institution': 'Stanford University',
      'year': '2020',
      'image': 'assets/images/pdf_icon.png',
      'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
    },
    {
      'title': 'Master in Software Engineering',
      'institution': 'MIT',
      'year': '2022',
      'image': 'assets/images/pdf_icon.png',
      'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
    },
  ];

  // Dummy data for certifications
  List<Map<String, String>> certifications = [
    {
      'title': 'Flutter Certified Application Developer',
      'provider': 'Google',
      'issued': 'April 2023',
      'image': 'assets/images/pdf_icon.png',
      'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
    },
    {
      'title': 'Cisco DevNet Professional',
      'provider': 'Cisco',
      'issued': 'July 2025',
      'image': 'assets/images/pdf_icon.png',
      'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
          'Professional Details',
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

              // Experience Dropdown
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff959595), width: 0.6),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedExperience,
                        hint: Text(
                          'Select experience level',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B6B6B),
                          ),
                        ),
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff6B6B6B)),
                        items: experienceOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff6B6B6B),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedExperience = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Gap(24),

              // Qualifications Section
              Text(
                'Qualifications',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Gap(12),

              // Qualification Cards
              ...qualifications.map((qualification) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: QualificationCard(
                    title: qualification['title']!,
                    institution: qualification['institution']!,
                    year: qualification['year']!,
                    imagePath: qualification['image']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(
                            pdfUrl: qualification['pdfUrl']!,
                            title: qualification['title']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),

              // Add New Qualification Button
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddQualificationScreen(),
                      ),
                    );
                    if (result != null && result is Map<String, String>) {
                      setState(() {
                        qualifications.add(result);
                      });
                    }
                  },
                  child: Text(
                    '+Add New',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF80D050),
                    ),
                  ),
                ),
              ),

              Gap(24),

              // Certifications Section
              Text(
                'Certifications',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Gap(12),

              // Certification Cards
              ...certifications.map((certification) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CertificationCard(
                    title: certification['title']!,
                    provider: certification['provider']!,
                    issued: certification['issued']!,
                    imagePath: certification['image']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(
                            pdfUrl: certification['pdfUrl']!,
                            title: certification['title']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),

              // Add New Certification Button
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCertificationScreen(),
                      ),
                    );
                    if (result != null && result is Map<String, String>) {
                      setState(() {
                        certifications.add(result);
                      });
                    }
                  },
                  child: Text(
                    '+Add New',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF80D050),
                    ),
                  ),
                ),
              ),

              Gap(40),

              // Next Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmploymentHistory(selectedRole: widget.selectedRole),
                    ),
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
      ),
    );
  }
}

// Qualification Card Widget
class QualificationCard extends StatelessWidget {
  final String? title;
  final String? institution;
  final String? year;
  final String? imagePath;
  final VoidCallback? onTap;

  const QualificationCard({
    super.key,
    this.title,
    this.institution,
    this.year,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff959595), width: 0.6),
        ),
        child: Row(
          children: [
            // Icon/Image
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 40,
                height: 40,
              ),
            Gap(12),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  Gap(4),
                  if (institution != null)
                    Text(
                      institution!,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                  Gap(2),
                  if (year != null)
                    Text(
                      'Year: $year',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Certification Card Widget
class CertificationCard extends StatelessWidget {
  final String? title;
  final String? provider;
  final String? issued;
  final String? imagePath;
  final VoidCallback? onTap;

  const CertificationCard({
    super.key,
    this.title,
    this.provider,
    this.issued,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff959595), width: 0.6),
        ),
        child: Row(
          children: [
            // Icon/Image
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 40,
                height: 40,
              ),
            Gap(12),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  Gap(4),
                  if (provider != null)
                    Text(
                      'Provider: $provider',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                  Gap(2),
                  if (issued != null)
                    Text(
                      'Issued: $issued',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}