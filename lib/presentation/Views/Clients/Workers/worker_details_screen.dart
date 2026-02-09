import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class WorkerDetailsScreen extends StatelessWidget {
  const WorkerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for CV and Cover Letter
    final List<Map<String, String>> documents = [
      {
        'title': 'Curriculum Vitae',
        'institution': 'Professional Resume',
        'year': '2024',
        'image': 'assets/images/pdf_icon.png',
        'pdfUrl': 'https://pdfobject.com/pdf/sample.pdf',
      },
      {
        'title': 'Cover Letter',
        'institution': 'Application Letter',
        'year': '2024',
        'image': 'assets/images/pdf_icon.png',
        'pdfUrl': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
      },
    ];

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
          "Worker Details",
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
            // Profile Picture
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFF80D050),
                    width: 3,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/id_pic4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Gap(16),

            // Full Name
            Center(
              child: Text(
                "John Anderson",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            Gap(30),

            // Documents Section
            Text(
              "Documents",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            Gap(16),

            // CV and Cover Letter Cards
            ...documents.map((document) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: QualificationCard(
                  title: document['title']!,
                  institution: document['institution']!,
                  year: document['year']!,
                  imagePath: document['image']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfViewerScreen(
                          pdfUrl: document['pdfUrl']!,
                          title: document['title']!,
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),

            Gap(20),
          ],
        ),
      ),
    );
  }
}

// QualificationCard Widget
class QualificationCard extends StatelessWidget {
  final String title;
  final String institution;
  final String year;
  final String imagePath;
  final VoidCallback onTap;

  const QualificationCard({
    super.key,
    required this.title,
    required this.institution,
    required this.year,
    required this.imagePath,
    required this.onTap,
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
          border: Border.all(
            color: Color(0xffE0E0E0),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // PDF Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            Gap(12),
            // Document Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Gap(4),
                  Text(
                    institution,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  Gap(2),
                  Text(
                    year,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
            // Arrow Icon
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xff9E9E9E),
            ),
          ],
        ),
      ),
    );
  }
}

// PDF Viewer Screen using Syncfusion
class PdfViewerScreen extends StatelessWidget {
  final String pdfUrl;
  final String title;

  const PdfViewerScreen({
    super.key,
    required this.pdfUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        enableDoubleTapZooming: true,
        enableTextSelection: true,
      ),
    );
  }
}