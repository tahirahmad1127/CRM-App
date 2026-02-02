import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post.dart';
import 'package:crm_app/presentation/Views/Clients/BottomBarFiles/Job/Custom%20Tabbar/custom_tabbar.dart';
import 'package:crm_app/presentation/Views/Clients/BottomBarFiles/Job/Interview_detail_popup.dart';
import 'package:crm_app/presentation/Views/Clients/TimeSheet/client_timesheet.dart';
import 'package:crm_app/presentation/elements/client_job_card.dart';
import 'package:crm_app/presentation/elements/client_job_card2.dart';
import 'package:crm_app/presentation/elements/client_job_card3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class ClientJobScreen extends StatefulWidget {
  const ClientJobScreen({super.key});

  @override
  State<ClientJobScreen> createState() => _ClientJobScreenState();
}

class _ClientJobScreenState extends State<ClientJobScreen> {
  String selectedFilter = 'Applied';
  final List<String> filters = [
    'Applied',
    'Shortlisted',
    'Interview',
    'Offered',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter Tabs
            CustomTabBar(
              tabs: filters,
              selectedTab: selectedFilter,
              onTabSelected: (tab) {
                setState(() {
                  selectedFilter = tab;
                });
              },
            ),

            Gap(16),

            // Content based on selected tab
            Expanded(
              child:
              selectedFilter == 'Applied' || selectedFilter == 'Shortlisted'
                  ? ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ClientJobCard(
                    imageUrl: 'assets/images/id_pic4.png',
                    name: 'Mirtain moll',
                    experience: '+3 Years',
                    onNextStage: () {
                      showDialog(
                        context: context,
                        builder: (context) => InterviewDetailPopup(
                          candidateName: 'Mirtain moll',
                          experience: '+3 Years',
                        ),
                      );
                    },
                    onReject: () {},
                  );
                },
              )
                  : selectedFilter == 'Interview'
                  ? ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ClientJobCard2(
                    imageUrl: 'assets/images/id_pic4.png',
                    name: 'Mirtain moll',
                    experience: '+3 Years',
                    interviewDate: 'Interview in 2 days',
                    onHire: () {},
                    onReject: () {},
                  );
                },
              )
                  : selectedFilter == 'Offered'
                  ? ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ClientJobCard3(
                    imageUrl: 'assets/images/id_pic4.png',
                    name: 'Mirtain moll',
                    experience: '+3 Years',
                    onConfirmed: () {},
                  );
                },
              )
                  : SizedBox(), // Empty for Interview and Offered tabs
            ),
          ],
        ),
      ),
    );
  }
}