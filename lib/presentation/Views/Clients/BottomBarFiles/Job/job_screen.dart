import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post.dart';
import 'package:crm_app/presentation/Views/Clients/BottomBarFiles/Job/Custom%20Tabbar/custom_tabbar.dart';
import 'package:crm_app/presentation/Views/Clients/BottomBarFiles/Job/Interview_detail_popup.dart';
import 'package:crm_app/presentation/Views/Clients/TimeSheet/client_timesheet.dart';
import 'package:crm_app/presentation/Views/Lead/Candidate%20(inside%20Jobs)/lead_candidate_screen.dart';
import 'package:crm_app/presentation/elements/client_job_card.dart';
import 'package:crm_app/presentation/elements/client_job_card2.dart';
import 'package:crm_app/presentation/elements/client_job_card3.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class ClientJobScreen extends StatefulWidget {
  const ClientJobScreen({super.key});

  @override
  State<ClientJobScreen> createState() => _ClientJobScreenState();
}

class _ClientJobScreenState extends State<ClientJobScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text(
          'Jobs',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadPostScreen()));
        },
        backgroundColor: Color(0xFF80D050),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // Job Cards
            JobCard(
              width: double.infinity,
              logoPath: "assets/images/id_pic.png",
              companyName: "BELLE",
              timeAgo: "2hr Ago",
              jobTitle: "Senior Industrial Manager",
              tags: ["Full-Time", "In Office"],
              location: "11 miles away, GA 30326, Atlanta",
              salary: "\$750 - 1k",
              isSaved: true,
              onApply: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CandidatesScreen(
                      jobTitle: 'Senior Industrial Manager',
                    ),
                  ),
                );
              },
            ),

            Gap(16),

            JobCard(
              width: double.infinity,
              logoPath: "assets/images/id_pic.png",
              companyName: "TECH CORP",
              timeAgo: "5hr Ago",
              jobTitle: "Software Engineer",
              tags: ["Full-Time", "Remote"],
              location: "Remote, United States",
              salary: "\$1.5k - 2k",
              isSaved: false,
              onApply: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CandidatesScreen(
                      jobTitle: 'Software Engineer',
                    ),
                  ),
                );
              },
            ),

            Gap(16),

            JobCard(
              width: double.infinity,
              logoPath: "assets/images/id_pic.png",
              companyName: "DESIGN STUDIO",
              timeAgo: "1 day Ago",
              jobTitle: "UX/UI Designer",
              tags: ["Part-Time", "Hybrid"],
              location: "5 miles away, NY 10001, New York",
              salary: "\$800 - 1.2k",
              isSaved: true,
              onApply: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CandidatesScreen(
                      jobTitle: 'UX/UI Designer',
                    ),
                  ),
                );
              },
            ),

            Gap(16),

            JobCard(
              width: double.infinity,
              logoPath: "assets/images/id_pic.png",
              companyName: "MARKETING PLUS",
              timeAgo: "3hr Ago",
              jobTitle: "Digital Marketing Specialist",
              tags: ["Full-Time", "Hybrid"],
              location: "8 miles away, CA 94102, San Francisco",
              salary: "\$900 - 1.3k",
              isSaved: false,
              onApply: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CandidatesScreen(
                      jobTitle: 'Digital Marketing Specialist',
                    ),
                  ),
                );
              },
            ),

            Gap(16),

            JobCard(
              width: double.infinity,
              logoPath: "assets/images/id_pic.png",
              companyName: "DATA INSIGHTS",
              timeAgo: "6hr Ago",
              jobTitle: "Data Analyst",
              tags: ["Full-Time", "Remote"],
              location: "Remote, Worldwide",
              salary: "\$1.2k - 1.8k",
              isSaved: true,
              onApply: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CandidatesScreen(
                      jobTitle: 'Data Analyst',
                    ),
                  ),
                );
              },
            ),

            Gap(24),
          ],
        ),
      ),
    );
  }
}