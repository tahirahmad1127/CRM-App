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
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 80,
                );
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
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 80,
                );
                if (image != null) {
                  setState(() {
                    _profileImage = File(image.path);
                  });
                }
              },
            ),
            Gap(10),
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

  void _removeSkill(int index) {
    setState(() {
      skills.removeAt(index);
    });
  }

  void _removeDocument(int index) {
    setState(() {
      documents.removeAt(index);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _dobController.dispose();
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff515151), size: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Profile',
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
            // Profile Photo Section
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(12),
                  Text(
                    'Change Photo',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6B6B6B),
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
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ),
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

            // Skills Chips with Remove
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                skills.length,
                    (index) => _buildSkillChipWithRemove(skills[index], index),
              ),
            ),
            Gap(16),

            // Add Skill Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _newSkillController,
                    onSubmitted: (_) => _addSkill(),
                    decoration: InputDecoration(
                      hintText: 'Add new skill',
                      hintStyle: GoogleFonts.poppins(
                        color: Color(0xff6B6B6B),
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Color(0xffF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      color: Color(0xff000000),
                      fontSize: 14,
                    ),
                  ),
                ),
                Gap(8),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff80D050),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: _addSkill,
                  ),
                ),
              ],
            ),
            Gap(30),

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

            // Documents List
            ...List.generate(
              documents.length,
                  (index) => Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: _buildDocumentItemWithRemove(
                  'assets/images/document_icon.png',
                  documents[index],
                  index,
                ),
              ),
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
                  setState(() {
                    documents.add(file.name);
                  });
                  print("File Name: ${file.name}");
                  print("File Path: ${file.path}");
                  print("File Size: ${file.size}");
                } else {
                  print("User cancelled the picker");
                }
              },
            ),

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
            Gap(40),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Save logic here
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff80D050),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Save Changes',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff6B6B6B),
          ),
        ),
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
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          style: GoogleFonts.poppins(
            color: Color(0xff000000),
            fontSize: 14,
            fontWeight: FontWeight.w500,
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

  Widget _buildSkillChipWithRemove(String skill, int index) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 8, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            skill,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff6B6B6B),
            ),
          ),
          Gap(8),
          InkWell(
            onTap: () => _removeSkill(index),
            child: Icon(
              Icons.close,
              size: 16,
              color: Color(0xff6B6B6B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentItemWithRemove(dynamic icon, String name, int index) {
    return Row(
      children: [
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
            name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff424242),
            ),
          ),
        ),
        InkWell(
          onTap: () => _removeDocument(index),
          child: Icon(
            Icons.close,
            size: 18,
            color: Color(0xff7E7E7E),
          ),
        ),
      ],
    );
  }
}