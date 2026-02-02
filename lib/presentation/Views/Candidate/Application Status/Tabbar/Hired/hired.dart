import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/Applied/Applied.dart';
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/application_status_screen.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Home/worker_home.dart';
import 'package:crm_app/presentation/Views/Worker/worker_bottom_bar.dart';
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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              Gap(50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> WorkerHomeScreen()));

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff80D050),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Go to Home',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
