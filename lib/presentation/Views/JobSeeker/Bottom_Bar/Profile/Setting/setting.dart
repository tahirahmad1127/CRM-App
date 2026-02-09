import 'package:crm_app/presentation/Views/JobSeeker/Auth/register_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further Screens/contact_us.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further Screens/faqs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further Screens/portfolio/portfolio Screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further Screens/privacy_policy.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further Screens/terms&conditions.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further Screens/documentation/documentation_screen.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Earning/earning.dart';
import 'package:crm_app/presentation/Views/Worker/Bottom_bar_screens/Timeheet/timesheet.dart';
import 'package:crm_app/presentation/elements/setting_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  final bool showTimesheet;
  final bool showEarning;
  final bool showDocumentation;
  final bool showPortfolio;

  final bool showPrivacyPolicy;
  final bool showTerms;
  final bool showContactUs;
  final bool showFaqs;
  final bool showNotifications;
  final bool showLogout;

  const SettingsScreen({
    super.key,
    this.showTimesheet = false,
    this.showEarning = false,
    this.showDocumentation = false,
    this.showPortfolio = false,
    this.showPrivacyPolicy = true,
    this.showTerms = true,
    this.showContactUs = true,
    this.showFaqs = true,
    this.showNotifications = true,
    this.showLogout = true,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;

  Widget _visible(bool condition, Widget child) {
    return condition ? child : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
            const Gap(20),

            _visible(
              widget.showPrivacyPolicy,
              SettingsListTile(
                title: 'Privacy Policy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
              ),
            ),

            _visible(
              widget.showTerms,
              SettingsListTile(
                title: 'Terms & Conditions',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TermsConditionsScreen(),
                    ),
                  );
                },
              ),
            ),

            _visible(
              widget.showContactUs,
              SettingsListTile(
                title: 'Contact Us',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContactUsScreen(),
                    ),
                  );
                },
              ),
            ),

            _visible(
              widget.showFaqs,
              SettingsListTile(
                title: 'FAQs',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FAQsScreen(),
                    ),
                  );
                },
              ),
            ),

            _visible(
              widget.showNotifications,
              SettingsListTile(
                title: 'Notification',
                trailing: SizedBox(
                  height: 24,
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
                      materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
                paddingVertical: 15,
                onTap: () {},
              ),
            ),

            _visible(
              widget.showLogout,
              SettingsListTile(
                title: 'Logout',
                textColor: Colors.red,
                showDivider: false,
                onTap: () => _showLogoutDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          'Logout',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const RegisterScreen(),
                ),
                    (_) => false,
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
