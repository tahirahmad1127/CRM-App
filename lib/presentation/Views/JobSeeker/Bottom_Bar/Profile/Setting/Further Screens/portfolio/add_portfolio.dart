import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/saved_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:file_picker/file_picker.dart';

class AddPortfolioScreen extends StatefulWidget {
  const AddPortfolioScreen({super.key});

  @override
  State<AddPortfolioScreen> createState() => _AddPortfolioScreenState();
}

class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  String? selectedMediaName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add Portfolio',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Project Title
            _buildLabel("Project Title", isRequired: true),
            const Gap(8),
            _buildTextField(titleController, "Enter project title"),
            const Gap(20),

            // 2. Your Role
            _buildLabel("Your Role (optional)", isRequired: false),
            const Gap(8),
            _buildTextField(roleController, "e.g. Lead Designer"),
            const Gap(20),

            // 3. Project Description
            _buildLabel("Project Description", isRequired: true),
            const Gap(8),
            _buildTextField(descController, "Enter project description", maxLines: 4),
            const Gap(20),

            // 4. Skills and Deliverables
            _buildLabel("Skills and Deliverables", isRequired: true),
            const Gap(8),
            _buildTextField(skillsController, "e.g. Flutter, Firebase, UI Design"),

            const Gap(24),
            const Divider(color: Color(0xffE0E0E0), thickness: 1),
            const Gap(24),

            // Media Upload Container
            Text(
              "Project Media",
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const Gap(12),
            _buildMediaUploadArea(),

            const Gap(40),

            // Submit Button
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SavedProfile()));
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF80D050),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  // Helper to build labels with optional red asterisks
  Widget _buildLabel(String text, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xff6B6B6B)),
        children: isRequired
            ? [const TextSpan(text: ' *', style: TextStyle(color: Colors.red))]
            : [],
      ),
    );
  }

  // Helper to build TextFields
  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.poppins(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 14, color: const Color(0xff959595)),
        filled: true,
        fillColor: const Color(0xffF9F9F9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff959595), width: 0.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff959595), width: 0.6),
        ),
      ),
    );
  }

  // Media Upload Logic
  Widget _buildMediaUploadArea() {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'mp4', 'mov'],
        );
        if (result != null) {
          setState(() => selectedMediaName = result.files.single.name);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff959595), width: 0.6, style: BorderStyle.solid),
        ),
        child: Column(
          children: [
            const Icon(Icons.cloud_upload_outlined, size: 40, color: Color(0xFF80D050)),
            const Gap(8),
            Text(
              selectedMediaName ?? "Add Image or Video",
              style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xff6B6B6B)),
            ),
          ],
        ),
      ),
    );
  }
}