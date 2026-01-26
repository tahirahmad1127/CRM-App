import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class EarningSummaryCard extends StatefulWidget {
  final String totalEarning;
  final String rate;
  final String period;
  final bool showApproved;
  final String? approvedAmount;
  final String? approvedHours;
  final bool showPending;
  final String? pendingAmount;
  final String? pendingHours;

  const EarningSummaryCard({
    Key? key,
    required this.totalEarning,
    required this.rate,
    this.period = 'This Week',
    this.showApproved = true,
    this.approvedAmount,
    this.approvedHours,
    this.showPending = true,
    this.pendingAmount,
    this.pendingHours,
  }) : super(key: key);

  @override
  State<EarningSummaryCard> createState() => _EarningSummaryCardState();
}

class _EarningSummaryCardState extends State<EarningSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xff959595)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Earning Summary',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff80D050).withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        'Rate:',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      Gap(2),
                      Text(
                        '${widget.rate}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff6B6B6B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(
            widget.period,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          Gap(5),
          Text(
            widget.totalEarning,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          // Approved
          _buildEarningRow(
            'Approved: vs Pending',
            widget.approvedAmount ?? '0',
            widget.approvedHours ?? '0',
            widget.pendingAmount ?? '0',
            widget.pendingHours ?? '0',
            Color(0xff8BC34A),
            Color(0xffFF9800),
          ),
        ],
      ),
    );
  }

  Widget _buildEarningRow(
      String label,
      String approvedAmount,
      String approvedHours,
      String pendingAmount,
      String pendingHours,
      Color approvedColor,
      Color pendingColor,
      ) {
    // Calculate progress steps - hardcoded to 70%
    final approvedSteps = 70;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff6B6B6B),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Approved: $approvedAmount',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
                Gap(2),
                Transform.translate(
                  offset: Offset(0, -7),
                  child: Text(
                    '.',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                ),
                Gap(2),
                Text(
                  '$approvedHours',
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B6B6B),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Pending: $pendingAmount',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
                Gap(2),
                Transform.translate(
                  offset: Offset(0, -7),
                  child: Text(
                    '.',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                ),
                Gap(2),
                Text(
                  '$pendingHours',
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B6B6B),
                  ),
                ),
              ],
            ),
          ],
        ),
        StepProgressIndicator(
          totalSteps: 100,
          currentStep: approvedSteps,
          size: 13,
          padding: 0,
          selectedColor: Color(0xff80D050), // 70% completed - green
          unselectedColor: Color(0xffEB9F25), // 30% incomplete - orange
          roundedEdges: Radius.circular(30),
        ),
      ],
    );
  }
}