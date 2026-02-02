import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Timesheet extends StatelessWidget {
  const Timesheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'Timesheet',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          // Header Row
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Start Time',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'End Time',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Break Duration',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Status',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Timesheet List
          Expanded(
            child: ListView(
              children: [
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Pending'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Rejected'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Rejected'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
                _buildTimesheetRow('Mar 23', '9:00AM', '9:00AM', '30 mins', 'Approved'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimesheetRow(
      String date,
      String startTime,
      String endTime,
      String breakDuration,
      String status,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff515151), width: 0.4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            startTime,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,

              color: Colors.black,
            ),
          ),
          Text(
            endTime,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,

              color: Colors.black,
            ),
          ),
          Text(
            breakDuration,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,

              color: Colors.black,
            ),
          ),
          _buildStatusWidget(status),
        ],
      ),
    );
  }

  Widget _buildStatusWidget(String status) {
    Color statusColor;

    switch (status.toLowerCase()) {
      case 'approved':
        statusColor = Color(0xFF70EB25);
        break;
      case 'pending':
        statusColor = Color(0xFFEB9F25);
        break;
      case 'rejected':
        statusColor = Color(0xFFEC1C24);
        break;
      default:
        statusColor = Colors.grey;
    }

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: statusColor,
          ),
        ),
        SizedBox(width: 6),
        Text(
          status,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}