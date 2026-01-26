import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class ClientJobCard extends StatelessWidget {
  final String name;
  final String experience;
  final String? imageUrl;
  final VoidCallback? onNextStage;
  final VoidCallback? onReject;

  const ClientJobCard({
    super.key,
    required this.name,
    required this.experience,
    this.imageUrl,
    this.onNextStage,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xff959595), width: 0.6),
      ),
      child: Row(
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: 50,
              height: 50,
              color: Color(0xffE0E0E0),
              child: imageUrl != null
                  ? Image.asset(imageUrl!, fit: BoxFit.cover)
                  : Icon(Icons.person, size: 30, color: Colors.grey),
            ),
          ),
          Gap(12),

          // Name and Experience
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Gap(2),
                Text(
                  experience,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B6B6B),
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons in Row
          Row(
            children: [
              GestureDetector(
                onTap: onNextStage,
                child: Container(
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xff80D050),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Next Stage',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(5),
              GestureDetector(
                onTap: onReject,
                child: Container(
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xffFF4444), width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'Reject',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF4444),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}