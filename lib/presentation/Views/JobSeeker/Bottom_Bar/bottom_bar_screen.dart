
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Chat/Chat.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Home/home_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Job/job_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/saved_profile.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Saved/saved.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  // Add your screens here
  final List<Widget> _screens = [
    HomeScreen(),
    JobScreen(),
    SavedJobsScreen(),
    ChatScreen(),
    SavedProfile(),
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
                  imagePath: 'assets/images/bb_icon1.png',
                  activeImagePath: 'assets/images/bb_icon1_2.png',
                  label: 'Home',
                  index: 0,
                ),
                _buildNavItem(
                  imagePath: 'assets/images/bb_icon2.png',
                  activeImagePath: 'assets/images/bb_icon2_2.png',
                  label: 'Job',
                  index: 1,
                ),
                _buildNavItem(
                  imagePath: 'assets/images/bb_icon3.png',
                  activeImagePath: 'assets/images/bb_icon3_2.png',
                  label: 'Saved',
                  index: 2,
                ),
                _buildNavItem(
                  imagePath: 'assets/images/bb_icon4.png',
                  activeImagePath: 'assets/images/bb_icon4_2.png',
                  label: 'Chat',
                  index: 3,
                ),
                _buildNavItem(
                  imagePath: 'assets/images/bb_icon5.png',
                  activeImagePath: 'assets/images/bb_icon5_2.png',
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
    IconData? icon,
    IconData? activeIcon,
    String? imagePath,
    String? activeImagePath,
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
            // Use image if provided, otherwise use icon
            imagePath != null
                ? Image.asset(
              isActive ? (activeImagePath ?? imagePath) : imagePath,
              width: 24,
              height: 24,
              color: isActive ? Color(0xff80D050) : Color(0xff9CA3AF),
            )
                : Icon(
              isActive ? (activeIcon ?? icon!) : icon!,
              color: isActive ? Color(0xff80D050) : Color(0xff9CA3AF),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
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
