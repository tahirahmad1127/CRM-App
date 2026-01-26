import 'package:crm_app/presentation/Views/Clients/Workers/client_workers_screen.dart';
import 'package:crm_app/presentation/elements/client_timesheet_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
// import 'client_timesheet_template.dart';

class ClientTimeSheetScreen extends StatefulWidget {
  const ClientTimeSheetScreen({super.key});

  @override
  State<ClientTimeSheetScreen> createState() => _ClientTimeSheetScreenState();
}

class _ClientTimeSheetScreenState extends State<ClientTimeSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ClientWorkersScreen()));
          }, icon: Icon(Icons.arrow_forward))
        ],
        centerTitle: true,
        title: Text(
          'Timesheet',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ClientTimesheetTemplate(
            imageUrl: 'assets/images/id_pic4.png',
            name: 'Mirtain moll',
            role: 'Operator',
            shift: 'Morning Shift',
            time: '9:00 AM - 5:00 PM',
            date: 'Apr 4, 2025',
            location: '11 miles away, GA 30326, Atlanta',
            onApprove: () {
            },
            onReject: () {
            },
          );
        },
      ),
    );
  }
}
