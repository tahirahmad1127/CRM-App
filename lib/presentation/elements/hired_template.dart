import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class HiredCard extends StatelessWidget {
  final String position;
  final String startDate;
  final String reportingTo;
  final String email;
  final String phone;
  final List<String> nextSteps;

  const HiredCard({
    Key? key,
    required this.position,
    required this.startDate,
    required this.reportingTo,
    required this.email,
    required this.phone,
    required this.nextSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Congratulation Header
        Center(
          child: Text(
            'Congratulation',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
            ),
          ),
        ),
        Gap(20),

        // Position Section
        Text(
          'Position',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
        Gap(6),
        Text(
          position,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
        Gap(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Color(0xff80D050),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'Hired',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
        Gap(20),

        // Start Date and Reporting To Row
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Date:',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  Gap(6),
                  Text(
                    'Reporting To:',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    startDate,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  Gap(6),
                  Text(
                    reportingTo,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(20),

        // Next Steps Section
        Text(
          'Next Steps:',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
        Gap(12),

        // Next Steps List
        ...nextSteps.map((step) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2),
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Color(0xff80D050),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              Gap(10),
              Expanded(
                child: Text(
                  step,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
        )),
        Gap(10),

        // Company Contact Section
        Text(
          'Company Contact:',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
        Gap(12),

        // Email
        Row(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/email2.png', // Replace with your image path
                  width: 18,
                  height: 18,
                  color: Color(0xff6B6B6B), // Optional: adds color tint
                ),
                Gap(5),
                Text(
                  email,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.phone_outlined, size: 18, color: Color(0xff7E7E7E)),
                Gap(5),
                Text(
                  phone,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
              ],
            ),

          ],
        ),
      ],
    );
  }
}

// Usage Example:
// CongratulationCard(
//   position: 'Senior Industrial manager',
//   startDate: '10 December, 2025',
//   reportingTo: 'Operations Director',
//   email: 'hr@abcindustries.com',
//   phone: '+1 555 332 9080',
//   nextSteps: [
//     'Complete onboarding documents',
//     'Upload required identity verification',
//     'Attend orientation meeting (9 January)',
//     'HR will send login credentials soon',
//   ],
// )