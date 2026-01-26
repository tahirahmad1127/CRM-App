import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetails extends StatelessWidget {
  final String imagePath;
  final String jobTitle;
  final String companyName;
  final String timeAgo;

  const JobDetails({
    super.key,
    required this.imagePath,
    required this.jobTitle,
    required this.companyName,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile / Company Image
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath), // use NetworkImage() if online
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10), // spacing between image and text
        // Texts
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              jobTitle,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: FrontendConfigs.kBlackColor,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  companyName,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff959595),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  timeAgo,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9A9A9A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
