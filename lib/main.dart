
import 'package:crm_app/presentation/Views/Candidate/Application%20Status/Tabbar/application_status_screen.dart';
import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post.dart';
import 'package:crm_app/presentation/Views/Clients/Add%20post/Upload%20post/upload_post1.dart';
import 'package:crm_app/presentation/Views/Clients/TimeSheet/client_timesheet.dart';
import 'package:crm_app/presentation/Views/Clients/clients_bottom_bar.dart';
import 'package:crm_app/presentation/Views/JobSeeker/splash_screen/splash_screen.dart';
import 'package:crm_app/presentation/Views/Lead/Bottom_Bar%20Screens/lead_home.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Earning/dispute_center/dispute_center.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Home/Break_mangement/break_management.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Home/clock%20in-out/clock_in.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Home/clock%20in-out/clock_out.dart';
import 'package:crm_app/presentation/Views/Worker/worker_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen());
  }
}
