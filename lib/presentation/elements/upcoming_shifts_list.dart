import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class UpcomingShiftsList extends StatelessWidget {
  final List<ShiftData> shifts;
  final bool showShifts;

  const UpcomingShiftsList({
    Key? key,
    required this.shifts,
    this.showShifts = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showShifts) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Shifts',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Gap(10),
        ...shifts.asMap().entries.map((entry) {
          final index = entry.key;
          final shift = entry.value;
          return Column(
            children: [
              if (index > 0) Gap(12),
              InkWell(
                onTap: shift.onTap,
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shift.date,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Gap(2),
                          Text(
                            shift.time,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 22,
                        color: Color(0xff7E7E7E),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}

class ShiftData {
  final String date;
  final String time;
  final VoidCallback? onTap;

  ShiftData({required this.date, required this.time, this.onTap});
}
