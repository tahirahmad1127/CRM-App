import 'package:crm_app/presentation/Views/JobSeeker/professional%20details/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sampleDocs = [
      {'name': 'Professional_Resume.pdf', 'size': '1.2 MB', 'date': 'Oct 12, 2025'},
      {'name': 'Project_Portfolio_v2.pdf', 'size': '4.5 MB', 'date': 'Nov 05, 2025'},
      {'name': 'Certification_UI_UX.pdf', 'size': '850 KB', 'date': 'Jan 20, 2026'},
      {'name': 'Recommendation_Letter.pdf', 'size': '400 KB', 'date': 'Feb 01, 2026'},
      {'name': 'Academic_Transcripts.pdf', 'size': '2.1 MB', 'date': 'Feb 03, 2026'},
    ];

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
          'Documents',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: sampleDocs.length,
        separatorBuilder: (context, index) => const Gap(12),
        itemBuilder: (context, index) {
          final doc = sampleDocs[index];
          return GestureDetector(
            onTap: () {
              // Navigate to PDF Viewer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerScreen(pdfUrl: "https://pdfobject.com/pdf/sample.pdf", title: "Document"),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffE0E0E0), width: 1),
              ),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/pdf_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doc['name']!,
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        Text(
                          '${doc['size']} • ${doc['date']}',
                          style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xff6B6B6B)),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Color(0xff959595)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}