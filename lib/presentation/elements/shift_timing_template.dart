import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class ShiftTimingCard extends StatelessWidget {
  final String shiftTime;
  final String status;
  final String location;
  final bool showGpsStatus;
  final bool showStatusBadge;
  final bool showLocation;
  final bool showClockInButton;
  final String statusBadgeText;
  final Color statusBadgeColor;
  final VoidCallback? onClockIn;

  const ShiftTimingCard({
    Key? key,
    required this.shiftTime,
    this.status = 'Ongoing',
    required this.location,
    this.showGpsStatus = true,
    this.showStatusBadge = true,
    this.showLocation = true,
    this.showClockInButton = true,
    this.statusBadgeText = 'Ongoing',
    this.statusBadgeColor = const Color(0xff2196F3),
    this.onClockIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Shift",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
        Gap(12),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff959595)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(12),

              // Shift Timing Row
              Row(
                children: [
                  Text(
                    'Shift Timing',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  Spacer(),
                  if (showGpsStatus) ...[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Color(0xff37D228),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Gap(6),
                    Text(
                      'Gps Status',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ],
              ),
              Gap(6),
              Text(
                shiftTime,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
              Gap(12),

              // Status Badge
              if (showStatusBadge)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusBadgeColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    statusBadgeText,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (showStatusBadge) Gap(12),

              // Location
              if (showLocation) ...[
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/maps.png', width: 50),

                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xff80D050),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),

                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),

                    Gap(6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff040404),
                          ),
                        ),
                        Gap(4),
                        Text(
                          location,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff515151),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
              Gap(10),

              // Clock In Button
              if (showClockInButton)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onClockIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8BC34A),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Clock In',
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
      ],
    );
  }
}
