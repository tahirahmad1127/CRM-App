import 'package:crm_app/presentation/Views/JobSeeker/Auth/step3_verification.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/code_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:io';

class VideoUploadScreen extends StatefulWidget {
  final String selectedRole;

  const VideoUploadScreen({
    super.key,
    required this.selectedRole,
  });

  @override
  State<VideoUploadScreen> createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  File? _selectedVideo;
  String? _videoFileName;
  String? _thumbnailPath;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        _selectedVideo = File(video.path);
        _videoFileName = video.name;
      });

      // Generate thumbnail
      await _generateThumbnail(video.path);
    }
  }

  Future<void> _generateThumbnail(String videoPath) async {
    final thumbnail = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      thumbnailPath: (await Directory.systemTemp.createTemp()).path,
      imageFormat: ImageFormat.PNG,
      quality: 75,
    );

    if (thumbnail != null) {
      setState(() {
        _thumbnailPath = thumbnail;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Introductory Video',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(8),

              // Upload Video Container
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Your Video',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  Gap(8),
                  GestureDetector(
                    onTap: _pickVideo,
                    child: DottedBorder(
                      color: Color(0xff959595),
                      strokeWidth: 1.5,
                      dashPattern: [8, 4],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(8),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: _selectedVideo != null
                            ? Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background Layer: Thumbnail
                            if (_thumbnailPath != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(_thumbnailPath!),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )
                            else
                              Center(
                                child: Icon(
                                  Icons.video_library,
                                  size: 60,
                                  color: Color(0xFF80D050),
                                ),
                              ),

                            // Dark overlay
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(color: Colors.black.withOpacity(0.3))
                            ),

                            // Foreground Layer: Text
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      _videoFileName ?? 'Video Selected',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    'Tap to change video',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.videocam_outlined,
                              size: 60,
                              color: Color(0xff959595),
                            ),
                            Gap(12),
                            Text(
                              'Upload Video',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF80D050),
                              ),
                            ),
                            Gap(4),
                            Text(
                              'Tap to select a video from gallery',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff6B6B6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Gap(24),

              // Video Guidelines
              Text(
                'Video Guidelines',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Gap(12),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xff959595), width: 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRuleItem(
                      '1. Duration',
                      'Video should be between 30 seconds to 2 minutes',
                    ),
                    Gap(12),
                    _buildRuleItem(
                      '2. Content',
                      'Introduce yourself, your skills, and your experience professionally',
                    ),
                    Gap(12),
                    _buildRuleItem(
                      '3. Quality',
                      'Ensure good lighting and clear audio quality',
                    ),
                    Gap(12),
                    _buildRuleItem(
                      '4. Format',
                      'Accepted formats: MP4, MOV, AVI (Max size: 100MB)',
                    ),
                    Gap(12),
                    _buildRuleItem(
                      '5. Appearance',
                      'Dress professionally and maintain a clean background',
                    ),
                    Gap(12),
                    _buildRuleItem(
                      '6. Language',
                      'Speak clearly in English or your preferred language',
                    ),
                  ],
                ),
              ),

              Gap(40),

              // Submit Button with role-based navigation
              GestureDetector(
                onTap: () {
                  if (_selectedVideo != null) {
                    // Navigate based on selected role
                    if (widget.selectedRole == "Employer") {
                      // Employer goes to Step3Verification (ID verification)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step3Verification(selectedRole: widget.selectedRole),
                        ),
                      );
                    } else {
                      // Job Seeker skips ID verification and goes directly to CodeVerificationScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CodeVerificationScreen(selectedRole: widget.selectedRole),
                        ),
                      );
                    }
                  } else {
                    // Show error if no video selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please upload a video first'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFF80D050),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Gap(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Gap(4),
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xff6B6B6B),
          ),
        ),
      ],
    );
  }
}