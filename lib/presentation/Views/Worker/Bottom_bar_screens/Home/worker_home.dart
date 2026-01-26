import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Home/clock%20in-out/clock_in.dart';
import 'package:crm_app/presentation/elements/earning_summary_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/shift_timing_template.dart';
import 'package:crm_app/presentation/elements/upcoming_shifts_list.dart';
import 'package:crm_app/presentation/elements/weekly_hours_template.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WorkerHomeScreen extends StatefulWidget {
  const WorkerHomeScreen({Key? key}) : super(key: key);

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/profile_pic.png", width: 60),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Morgan mills",
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: FrontendConfigs.kBlackColor,
                        ),
                        MyText(
                          text: "Good Morning",
                          fontWeight: FontWeight.w400,
                          size: 14,
                          color: FrontendConfigs.kBlackColor,
                        ),
                      ],
                    ),
                  ),
                  MyContainer(
                    width: 40,
                    height: 36,
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(6),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/bell.png"),
                    ),
                  ),
                ],
              ),
            ),
            ShiftTimingCard(
              shiftTime: '9:00 AM - 5:00 PM',
              location: '11 miles away, GA 30326, Atlanta',
              showGpsStatus: true,
              showStatusBadge: true,
              showLocation: true,
              showClockInButton: true,
              statusBadgeText: 'Ongoing',
              statusBadgeColor: Color(0xff2196F3),
              onClockIn: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClockIn()),
                );
              },
            ),
            Gap(20),

            // Earning Summary Card
            EarningSummaryCard(
              totalEarning: '\$800.00',
              rate: '\$15/hr',
              period: 'This Week',
              showApproved: true,
              approvedAmount: '\$240',
              approvedHours: '16 Hrs',
              showPending: true,
              pendingAmount: '\$45',
              pendingHours: '16 Hrs',
            ),
            Gap(20),

            // Weekly Hours Chart
            WeeklyHoursChart(
              showChart: true,
              chartData: [
                ChartData('Mon', 6, Color(0xff6B6B6B)),
                ChartData('Tue', 8, Color(0xff6B6B6B)),
                ChartData('Wed', 5, Color(0xff6B6B6B)),
                ChartData('Thu', 7, Color(0xff6B6B6B)),
                ChartData('Fri', 9, Color(0xff6B6B6B)),
                ChartData('Sat', 4, Color(0xff6B6B6B)),
                ChartData('Sun', 3, Color(0xff6B6B6B)),
              ],
            ),
            Gap(20),

            // Upcoming Shifts List
            UpcomingShiftsList(
              showShifts: true,
              shifts: [
                ShiftData(
                  date: 'Thu, Dec 2025',
                  time: '9:00AM - 5:00PM',
                  onTap: () {},
                ),
                ShiftData(
                  date: 'Thu, Dec 2025',
                  time: '9:00AM - 5:00PM',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
