import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class SavedProfile extends StatelessWidget {
  const SavedProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          'Profile',
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
            // Profile Image and Edit Button
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage('assets/images/profile_pic.png'),
                  ),
                  Gap(12),
                  Text(
                    'Morgan Mill',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Gap(12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff80D050),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
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
            _buildInfoRow(Icons.phone_outlined, '+23 22201123'),
            Gap(10),
            _buildInfoRow("assets/images/email2.png",'Example232@gmail.com'),
            Gap(10),
            _buildInfoRow(Icons.location_on_outlined, '2484 Royal Ln. Mesa, New Jersey 45463'),
            Gap(10),
            _buildInfoRow("assets/images/calender.png", 'January 1, 1990'),
            Gap(20),

            // Skills Section
            Text(
              'Skills',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Gap(12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildSkillChip('Graphic Designer'),
                _buildSkillChip('UX Designer'),
                _buildSkillChip('Video Editor'),
                _buildSkillChip('Adobe Photoshop'),
                _buildSkillChip('+ Add Skill'),

              ],
            ),
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
            _buildDocumentItem('assets/images/document_icon.png', 'Resume.pdf'),
            Gap(8),
            _buildDocumentItem('assets/images/document_icon.png', 'Experience Letter.pdf'),
            Gap(8),
            _buildDocumentItem('assets/images/document_icon.png', 'Portfolio.docx'),
            Gap(12),
            _buildSkillChip('+ Upload Document'),

            Gap(30),

            // Preferences Section
            Text(
              'Preferences',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Gap(12),
            Row(
              children: [
                _buildSkillChip('Full Time'),
                Gap(15),
                _buildSkillChip('Remote'),


              ],
            ),
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
            ? Icon(icon, size: 18, color: Color(0xff7E7E7E))
            : Image.asset(
          icon as String,
          width: 18,
          height: 18,
          color: Color(0xff7E7E7E),
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