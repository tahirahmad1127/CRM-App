import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/job_offer_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            JobOfferCard(
              jobTitle: 'Senior Industrial manager',
              industry: 'Tech Industry',
              offerSalary: '\$92,000/ year',
              jobType: 'Full-Time',
              location: 'New York (Hybrid)',
              joiningDate: '10 Dec, 2025',
              recruiterNote:
                  'We are excited to have you onboard. This role is offers for leadership growth and cross-department collaboration',
              onAccept: () {},
              onDecline: () {},
              onViewOfferLetter: () {},
              onViewCompanyPolicy: () {},
            ),
          ],
        ),
      ),
    );
  }
}
