import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class JobOfferCard extends StatelessWidget {
  final String jobTitle;
  final String industry;
  final String offerSalary;
  final String jobType;
  final String location;
  final String joiningDate;
  final String recruiterNote;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onViewOfferLetter;
  final VoidCallback? onViewCompanyPolicy;

  const JobOfferCard({
    Key? key,
    required this.jobTitle,
    required this.industry,
    required this.offerSalary,
    required this.jobType,
    required this.location,
    required this.joiningDate,
    required this.recruiterNote,
    this.onAccept,
    this.onDecline,
    this.onViewOfferLetter,
    this.onViewCompanyPolicy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xff959595),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Offer Header
              Text(
                'Job Offer',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              Gap(4),
              Text(
                jobTitle,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
              Gap(2),
              Text(
                industry,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
              Gap(16),

              // Offer Detail Section
              Text(
                'Offer Detail',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              Gap(14),

              // Offer Salary
              _buildDetailRow(
                icon: 'assets/images/money_icon.png',
                label: 'Offer Salary',
                value: offerSalary,
              ),
              Gap(12),

              // Job Type
              _buildDetailRow(
                icon: 'assets/images/job_icon2.png',
                label: 'Job Type',
                value: jobType,
              ),
              Gap(12),

              // Location
              _buildDetailRow(
                icon: Icons.location_on_outlined,
                label: 'Location',
                value: location,
              ),
              Gap(12),

              // Joining Date
              _buildDetailRow(
                icon: 'assets/images/calender.png',
                label: 'Joining Date',
                value: joiningDate,
              ),
              Gap(20),

              // Attachments Section
              Text(
                'Attachments',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Gap(12),

              // Offer Letter
              _buildAttachmentRow(
                icon: 'assets/images/document_icon.png',
                label: 'Offer Letter',
                onTap: onViewOfferLetter,
              ),
              Gap(10),

              // Company Policy
              _buildAttachmentRow(
                icon: 'assets/images/document_icon.png',
                label: 'Company Policy',
                onTap: onViewCompanyPolicy,
              ),
              Gap(20),

              // Recruiter Note Section
              Text(
                'Recruiter Note',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
              Gap(8),
              Text(
                recruiterNote,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6B6B6B),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Gap(20),

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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffE33333),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

  }

  Widget _buildDetailRow({
    required dynamic icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        icon is IconData
            ? Icon(icon, size: 18, color: Color(0xff9A9A9A))
            : Image.asset(
          icon as String,
          width: 18,
          height: 18,
          color: Color(0xff7E7E7E),
        ),
        Gap(12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color:    Color(0xff000000),
          ),
        ),
      ],
    );
  }

  Widget _buildAttachmentRow({
    required dynamic icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return Row(
      children: [
        icon is IconData
            ? Icon(icon, size: 18, color: Color(0xff9A9A9A))
            : Image.asset(
          icon as String,
          width: 18,
          height: 18,
          color: Color(0xff7E7E7E),
        ),        Gap(12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff515151),
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff80D050), width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'View',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff80D050),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Usage Example:
// JobOfferCard(
//   jobTitle: 'Senior Industrial manager',
//   industry: 'Tech Industry',
//   offerSalary: '\$92,000/ year',
//   jobType: 'Full-Time',
//   location: 'New York (Hybrid)',
//   joiningDate: '10 Dec, 2025',
//   recruiterNote: 'We are excited to have you onboard. This role is offers for leadership growth and cross-department collaboration',
//   onAccept: () {},
//   onDecline: () {},
//   onViewOfferLetter: () {},
//   onViewCompanyPolicy: () {},
// )