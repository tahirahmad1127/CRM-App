import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/hired_template.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/job_offer_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Hired extends StatefulWidget {
  const Hired({super.key});

  @override
  State<Hired> createState() => _HiredState();
}

class _HiredState extends State<Hired> {
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
            HiredCard(
              position: 'Senior Industrial manager',
              startDate: '10 December, 2025',
              reportingTo: 'Operations Director',
              email: 'hr@abcindustries.com',
              phone: '+1 555 332 9080',
              nextSteps: [
                'Complete onboarding documents',
                'Upload required identity verification',
                'Attend orientation meeting (9 January)',
                'HR will send login credentials soon',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
