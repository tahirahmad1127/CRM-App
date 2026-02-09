import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController =
  TextEditingController(text: 'Morgan Mill');
  final TextEditingController _phoneController =
  TextEditingController(text: '+23 2222 122');
  final TextEditingController _emailController =
  TextEditingController(text: 'Example322@gmail.com');
  final TextEditingController _addressController =
  TextEditingController(text: '2464 Royal Ln. Mesa, New Jersey, 48463');
  final TextEditingController _dobController =
  TextEditingController(text: 'January 1 1990');

  // ✅ NEW SOCIAL CONTROLLERS
  final TextEditingController _linkedinController =
  TextEditingController(text: 'linkedin.com/in/morgan-mill');
  final TextEditingController _githubController =
  TextEditingController(text: 'github.com/morganmill');

  final TextEditingController _newSkillController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _profileImage;

  List<String> skills = [
    'Graphic Designer',
    'UX Designer',
    'Video Editor',
    'Adobe Photoshop'
  ];

  List<String> documents = [
    'Resume.pdf',
    'Experience Letter.pdf',
    'Portfolio.docx',
  ];

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Profile Photo',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Gap(20),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Color(0xff80D050)),
              title: Text(
                'Take Photo',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image =
                await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  setState(() {
                    _profileImage = File(image.path);
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Color(0xff80D050)),
              title: Text(
                'Choose from Gallery',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    _profileImage = File(image.path);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addSkill() {
    if (_newSkillController.text.trim().isNotEmpty) {
      setState(() {
        skills.add(_newSkillController.text.trim());
        _newSkillController.clear();
      });
    }
  }

  void _removeSkill(int index) => setState(() => skills.removeAt(index));
  void _removeDocument(int index) => setState(() => documents.removeAt(index));

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _linkedinController.dispose(); // ✅
    _githubController.dispose();   // ✅
    _newSkillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,
              color: Color(0xff515151), size: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// PROFILE PHOTO
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : AssetImage('assets/images/profile_pic.png')
                        as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: _pickImage,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFF80D050),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.camera_alt,
                                color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                ],
              ),
            ),

            /// PERSONAL INFO
            Text('Personal Information',
                style: _sectionTitleStyle()),
            Gap(16),

            _buildInputField('Full Name', _nameController),
            Gap(16),
            _buildInputField('Phone Number', _phoneController),
            Gap(16),
            _buildInputField('Email Address', _emailController),
            Gap(16),
            _buildInputField('Address', _addressController),
            Gap(16),
            _buildInputField('Date of Birth', _dobController),

            Gap(30),

            /// ✅ SOCIAL ACCOUNTS SECTION
            Text('Social Accounts',
                style: _sectionTitleStyle()),
            Gap(16),

            _buildInputField('LinkedIn Profile URL', _linkedinController),
            Gap(16),
            _buildInputField('GitHub Profile URL', _githubController),

            Gap(30),

            /// SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Save logic
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff80D050),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _sectionTitleStyle() {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff6B6B6B))),
        Gap(8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      ],
    );
  }
}
