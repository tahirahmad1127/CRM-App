import 'package:crm_app/presentation/Views/JobSeeker/Video/video_upload_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/professional%20details/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'add_employment_screen.dart';

class EmploymentHistory extends StatefulWidget {
  final String selectedRole;

  const EmploymentHistory({
    super.key,
    required this.selectedRole,
  });

  @override
  State<EmploymentHistory> createState() => _EmploymentHistoryState();
}

class _EmploymentHistoryState extends State<EmploymentHistory> {
  // Dummy data for employment history
  List<Map<String, String>> employmentList = [
    {
      'title': 'Tech Lead | SkyPulse Solutions Pvt Ltd.',
      'duration': 'January 2023 - Present',
      'description':
      'I am working as a Project Manager and Tech Lead, overseeing end-to-end Mobile App...',
      'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
    },
    {
      'title': 'Senior Software Engineer | Deuseca',
      'duration': 'August 2020 - December 2022',
      'description':
      'I worked as a Senior Software Engineer, specializing in Flutter, Android App Development...',
      'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
    },
    {
      'title': 'Flutter Developer | PR Smart Solutions',
      'duration': 'December 2019 - July 2020',
      'description':
      'I worked as a Mobile App Developer, specializing in Flutter, Android App Development, and iOS App...',
      'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
    },
  ];

  void _deleteEmployment(int index) {
    setState(() {
      employmentList.removeAt(index);
    });
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
          'Employment History',
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

              // Employment Cards
              ...employmentList.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> employment = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: EmploymentCard(
                    title: employment['title']!,
                    duration: employment['duration']!,
                    description: employment['description']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(
                            pdfUrl: employment['pdfUrl']!,
                            title: employment['title']!,
                          ),
                        ),
                      );
                    },
                    onDelete: () => _deleteEmployment(index),
                  ),
                );
              }).toList(),

              // Add New Employment Button
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEmploymentScreen(),
                      ),
                    );
                    if (result != null && result is Map<String, String>) {
                      setState(() {
                        employmentList.add(result);
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
                  // Navigate to Video Upload Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoUploadScreen(selectedRole: widget.selectedRole),
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

// Employment Card Widget
class EmploymentCard extends StatelessWidget {
  final String title;
  final String duration;
  final String description;
  final VoidCallback? onTap;
  final VoidCallback onDelete;

  const EmploymentCard({
    super.key,
    required this.title,
    required this.duration,
    required this.description,
    this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff959595), width: 0.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Gap(8),
            Text(
              duration,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff6B6B6B),
              ),
            ),
            Gap(8),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xff6B6B6B),
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}