import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class ClientTimesheetTemplate extends StatelessWidget {
  final String name;
  final String role;
  final String shift;
  final String time;
  final String date;
  final String location;
  final String? imageUrl;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  const ClientTimesheetTemplate({
    super.key,
    required this.name,
    required this.role,
    required this.shift,
    required this.time,
    required this.date,
    required this.location,
    this.imageUrl,
    this.onApprove,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff959595), width: 0.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Profile and Time
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 50,
                  color: const Color(0xffE0E0E0),
                  child: imageUrl != null
                      ? Image.asset(imageUrl!, fit: BoxFit.cover)
                      : const Icon(Icons.person, size: 35, color: Colors.grey),
                ),
              ),
              const Gap(5),
              // Name, Role and Shift
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          time,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$role · $shift',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff6B6B6B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Gap(10),
          // Date Row
          Row(
            children: [
              Image.asset(
                'assets/images/calender.png',
                width: 18,
                color: const Color(0xff6B6B6B),
              ),
              const Gap(6),
              Text(
                date,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff6B6B6B),
                ),
              ),
            ],
          ),
          const Gap(10),

          // Combined Row: Address + Buttons (Left) and Map (Right)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Address and Buttons
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Location Row
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Color(0xff6B6B6B),
                        ),
                        const Gap(6),
                        Expanded(
                          child: Text(
                            location,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff6B6B6B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    // Action Buttons Row
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onApprove,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xff80D050),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Approve',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: onReject,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xffFF4444), width: 1.5),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'Reject',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffEC1C24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Right Side: Map Image
              Container(
                width: 70,
                decoration: BoxDecoration(
                  color: const Color(0xffE0E0E0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset("assets/images/maps.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}