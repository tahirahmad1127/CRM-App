import 'package:crm_app/presentation/Views/Clients/BottomBarFiles/Job/job_screen.dart';
import 'package:crm_app/presentation/Views/Clients/Workers/client_workers_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/saved_profile.dart';
import 'package:crm_app/presentation/Views/Lead/lead_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadBottomBar extends StatefulWidget {
  const LeadBottomBar({super.key});

  @override
  State<LeadBottomBar> createState() => _LeadBottomBarState();
}

class _LeadBottomBarState extends State<LeadBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    LeadHomeScreen(),
    ClientJobScreen(),
    ClientWorkersScreen(),
    Center(
      child: Text(
        "Payment Screen",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    SavedProfile(fromBottomBar: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: 'assets/images/home.png',
                  label: 'Home',
                  index: 0,
                ),
                _buildNavItem(
                  icon: 'assets/images/job_icon2.png',
                  label: 'Jobs',
                  index: 1,
                ),
                _buildNavItem(
                  icon: 'assets/images/worker.png',
                  label: 'Workers',
                  index: 2,
                ),
                _buildNavItem(
                  icon: 'assets/images/payments.png',
                  label: 'Payment',
                  index: 3,
                ),
                _buildNavItem(
                  icon: 'assets/images/second_icon.png',
                  label: 'Profile',
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
  }) {
    final isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
              color: isActive
                  ? const Color(0xff80D050)
                  : const Color(0xff9CA3AF),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive
                    ? const Color(0xff80D050)
                    : const Color(0xff9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
