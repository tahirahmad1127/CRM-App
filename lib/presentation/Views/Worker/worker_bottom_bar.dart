
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Earning/earning.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Home/worker_home.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Timeheet/timesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerBottomBar extends StatefulWidget {
  const WorkerBottomBar({super.key});

  @override
  State<WorkerBottomBar> createState() => _WorkerBottomBarState();
}

class _WorkerBottomBarState extends State<WorkerBottomBar> {
  int _currentIndex = 0;

  // Add your screens here
  final List<Widget> _screens = [
    WorkerHomeScreen(),
    Timesheet(),
    Timesheet(),
    Earning(),
    Timesheet(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
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
                  activeIcon: 'assets/images/home.png',
                  label: 'Home',
                  index: 0,
                ),
                _buildNavItem(
                  icon: 'assets/images/calender.png',
                  activeIcon: 'assets/images/calender.png',
                  label: 'Calender',
                  index: 1,
                ),
                _buildNavItem(
                  icon: 'assets/images/redo.png',
                  activeIcon: 'assets/images/redo.png',
                  label: 'Timesheet',
                  index: 2,
                ),
                _buildNavItem(
                  icon: 'assets/images/wallet.png',
                  activeIcon: 'assets/images/wallet.png',
                  label: 'Earning',
                  index: 3,
                ),
                _buildNavItem(
                  icon: 'assets/images/second_icon.png',
                  activeIcon: "assets/images/second_icon.png",
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
    required dynamic icon,
    required dynamic activeIcon,
    required String label,
    required int index,
  }) {
    final isActive = _currentIndex == index;
    final currentIcon = isActive ? activeIcon : icon;

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
            currentIcon is IconData
                ? Icon(
              currentIcon,
              color: isActive ? Color(0xff80D050) : Color(0xff9CA3AF),
              size: 24,
            )
                : Image.asset(
              currentIcon as String,
              width: 24,
              height: 24,
              color: isActive ? Color(0xff80D050) : Color(0xff9CA3AF),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? Color(0xff80D050) : Color(0xff9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
