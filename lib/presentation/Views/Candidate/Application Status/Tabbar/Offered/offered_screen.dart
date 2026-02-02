import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Hired/hired.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Offered/Pdf%20Viewer/pdf_viewer.dart';
import 'package:crm_app/presentation/elements/job_offer_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';


class Offered extends StatefulWidget {
  const Offered({super.key});

  @override
  State<Offered> createState() => _OfferedState();
}

class _OfferedState extends State<Offered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offered",
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),

        ),
        centerTitle: true,
        backgroundColor: const Color(0xffFFFFFF),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                JobOfferCard(
                  jobTitle: 'Senior Industrial Manager',
                  industry: 'Tech Industry',
                  offerSalary: '\$92,000 / year',
                  jobType: 'Full-Time',
                  location: 'New York (Hybrid)',
                  joiningDate: '10 Dec, 2025',
                  recruiterNote:
                  'We are excited to have you onboard. This role offers leadership growth and cross-department collaboration.',
                  onAccept: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Hired(),
                      ),
                    );
                  },
                  onDecline: () {
                    Navigator.pop(context);
                  },

                  /// ✅ VIEW OFFER LETTER
                  onViewOfferLetter: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PdfViewerScreen(
                          title: 'Offer Letter',
                          pdfUrl:
'https://s24.q4cdn.com/216390268/files/doc_downloads/test.pdf'                        ),
                      ),
                    );
                  },

                  /// ✅ VIEW COMPANY POLICY
                  onViewCompanyPolicy: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PdfViewerScreen(
                          title: 'Company Policy',
                          pdfUrl:
                          'https://s24.q4cdn.com/216390268/files/doc_downloads/test.pdf',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
