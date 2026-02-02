import 'package:crm_app/presentation/Views/JobSeeker/Auth/register_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further%20Screens/contact_us.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further%20Screens/faqs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further%20Screens/privacy_policy.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further%20Screens/terms&conditions.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Earning/earning.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Timeheet/timesheet.dart';
import 'package:crm_app/presentation/elements/setting_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            //Timesheet List
            SettingsListTile(
              title: 'TimeSheet',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Timesheet()),
                );
              },
            ),
            SettingsListTile(
              title: 'Earning Summary',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Earning()),
                );
              },
            ),
            // Settings List
            SettingsListTile(
              title: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()),
                );
              },
            ),
            SettingsListTile(
              title: 'Terms & Conditions',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TermsConditionsScreen()),
                );
              },
            ),
            SettingsListTile(
              title: 'Contact Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ContactUsScreen()),
                );
              },
            ),
            SettingsListTile(
              title: 'FAQs',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FAQsScreen()),
                );
              },
            ),
            SettingsListTile(
              title: 'Notification',
              onTap: () {},
              trailing: SizedBox(
                height: 24, // same height as other tiles
                child: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                    activeColor: const Color(0xff80D050),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // removes extra padding
                  ),
                ),
              ),
              paddingVertical: 15, // slightly smaller to match other tiles
            ),

            SettingsListTile(
              title: 'Logout',
              textColor: Colors.red,
              onTap: () {
                _showLogoutDialog(context);
              },
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Logout',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff424242),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6B6B6B),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterScreen()),
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}