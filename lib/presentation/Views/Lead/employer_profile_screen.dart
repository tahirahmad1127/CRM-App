import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/setting.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/edit_profile/edit_profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployerProfileScreen extends StatelessWidget {
  final bool fromBottomBar;
  const EmployerProfileScreen({
    super.key,
    this.fromBottomBar = false, // default = show leading
  });

  // Function to open URL in browser
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen(
                  showPrivacyPolicy: true,
                  showTerms: true,
                  showContactUs: true,
                  showFaqs: true,
                  showNotifications: true,
                  showLogout: true,

                  showTimesheet: false,
                  showEarning: false,
                  showDocumentation: false,
                  showPortfolio: false,
                )),
              );
            },
            icon: Icon(CupertinoIcons.gear, color: Colors.black, size: 20),
          ),
        ],
        elevation: 0,
        title: Text(
          'Company Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image and Company Name
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage(
                      'assets/images/profile_pic.png',
                    ),
                  ),
                  Gap(12),
                  Text(
                    'Tech Solutions Inc.',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Gap(12),
                ],
              ),
            ),
            Gap(30),

            // Personal Information Section
            Text(
              'Personal Information',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ),
            Gap(14),
            _buildInfoRow(Icons.phone_outlined, '+1 (555) 123-4567'),
            Gap(10),
            _buildInfoRow("assets/images/email2.png", 'contact@techsolutions.com'),
            Gap(10),
            _buildInfoRow(
              Icons.location_on_outlined,
              '1234 Business Ave, Silicon Valley, CA 94025',
            ),
            Gap(20),

            // Alternate Contact Person Section
            Text(
              'Alternate Contact Person',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Gap(14),
            _buildInfoRow(Icons.person_outline, 'Sarah Johnson'),
            Gap(10),
            _buildInfoRow(Icons.phone_outlined, '+1 (555) 987-6543'),
            Gap(10),
            _buildInfoRow("assets/images/email2.png", 'sarah.johnson@techsolutions.com'),
            Gap(20),

            // Documents Section
            Text(
              'Documents',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Gap(12),
            _buildDocumentItem('assets/images/document_icon.png', 'Company Registration.pdf'),
            Gap(8),
            _buildDocumentItem(
              'assets/images/document_icon.png',
              'Business License.pdf',
            ),
            Gap(8),
            _buildDocumentItem(
              'assets/images/document_icon.png',
              'Tax Certificate.pdf',
            ),
            Gap(12),
            _buildSkillChip(
              '+ Upload Document',
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.any,
                );

                if (result != null) {
                  PlatformFile file = result.files.first;

                  print("File Name: ${file.name}");
                  print("File Path: ${file.path}");
                  print("File Size: ${file.size}");
                } else {
                  // User canceled the picker
                }
              },
            ),

            Gap(30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(dynamic icon, String text) {
    return Row(
      children: [
        // Check if icon is IconData or String (image path)
        icon is IconData
            ? Icon(icon, size: 18,)
            : Image.asset(
          icon as String,
          width: 18,
          height: 18,
        ),
        Gap(12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff515151),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(60),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          skill,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff6B6B6B),
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentItem(dynamic icon, String name) {
    return Row(
      children: [
        // Check if icon is IconData or String (image path)
        icon is IconData
            ? Icon(icon, size: 18, color: Color(0xff7E7E7E))
            : Image.asset(
          icon as String,
          width: 18,
          height: 18,
          color: Color(0xff7E7E7E),
        ),
        Gap(12),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff424242),
          ),
        ),
      ],
    );
  }
}