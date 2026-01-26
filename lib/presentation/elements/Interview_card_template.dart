import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class InterviewCard extends StatelessWidget {
  final String jobTitle;
  final String date;
  final String time;
  final String location;
  final String recruiterNote;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onReschedule;

  const InterviewCard({
    Key? key,
    required this.jobTitle,
    required this.date,
    required this.time,
    required this.location,
    required this.recruiterNote,
    this.onAccept,
    this.onDecline,
    this.onReschedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xff959595),
          width: 0.6,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Job Title
          Text(
            jobTitle,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Divider(color: Color(0xffE0E0E0), thickness: 1),
          Gap(12),

          // Date
          Text(
            'Date',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          Gap(4),
          Text(
            date,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Gap(16),

          // Time
          Text(
            'Time',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          Gap(4),
          Text(
            time,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          Gap(16),

          // Location
          Text(
            'Location',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          Gap(4),
          Text(
            location,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          Gap(12),
          Divider(color: Color(0xffE0E0E0), thickness: 1),
          Gap(12),
          // Recruiter Note
          Text(
            'Recruiter Note',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          Gap(4),
          Text(
            recruiterNote,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          Gap(5),
          Divider(color: Color(0xffE0E0E0), thickness: 1),
          Gap(5),
          // Accept and Decline Buttons Row
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff80D050),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Accept',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Gap(12),
              Expanded(
                child: OutlinedButton(
                  onPressed: onDecline,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Color(0xffE33333), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Decline',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE33333),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(12),

          // Reschedule Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onReschedule,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff80D050),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: Text(
                'Reschedule',
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
    );
  }
}
