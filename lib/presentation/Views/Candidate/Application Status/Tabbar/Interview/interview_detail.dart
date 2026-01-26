import 'dart:ffi';

import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/Interview_card_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InterviewDetails extends StatefulWidget {
  const InterviewDetails({super.key});

  @override
  State<InterviewDetails> createState() => _InterviewDetailsState();
}

class _InterviewDetailsState extends State<InterviewDetails> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(CupertinoIcons.arrow_left),
                    ),
                  ),
                  Text(
                    "Inteview Detail ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: FrontendConfigs.kBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            InterviewCard(
              jobTitle: 'Senior Industrial manager',
              date: '20 December 2025',
              time: '10:30 AM',
              location: '11 miles away, GA 30326, Atlanta',
              recruiterNote:
                  'Please Be Prepared to Discuss your Experience working with large team',
              onAccept: () {},
              onDecline: () {},
              onReschedule: () {},
            ),
          ],
        ),
      ),
    );
  }
}
