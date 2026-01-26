import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  final String logoPath;
  final String companyName;
  final String timeAgo;
  final String jobTitle;
  final List<String> tags;
  final String location;
  final String salary;
  final bool isSaved;
  final VoidCallback onApply;
  final double? width;

  // 🔹 Apply Button
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;

  // 🔹 Status Button
  final bool showStatusButton;
  final String statusText;
  final Color statusColor;
  final Color statusTextColor;

  // 🔹 NEW: Card Border Control
  final Color cardBorderColor;
  final double cardBorderWidth;

  // 🔹 NEW: Button Border Control
  final Color buttonBorderColor;
  final double buttonBorderWidth;

  const JobCard({
    super.key,
    required this.width,
    required this.logoPath,
    required this.companyName,
    required this.timeAgo,
    required this.jobTitle,
    required this.tags,
    required this.location,
    required this.salary,
    this.isSaved = false,
    required this.onApply,

    // Apply Button Defaults
    this.buttonText = "Apply Now",
    this.buttonColor = const Color(0xff80D050),
    this.buttonTextColor = Colors.white,

    // Status Button Defaults
    this.showStatusButton = false,
    this.statusText = "",
    this.statusColor = const Color(0xff4A90E2),
    this.statusTextColor = Colors.white,

    // Card Border Defaults
    this.cardBorderColor = const Color(0xff959595),
    this.cardBorderWidth = 0.6,

    // Button Border Defaults
    this.buttonBorderColor = Colors.transparent,
    this.buttonBorderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: width ?? double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: cardBorderColor,
          width: cardBorderWidth,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage(logoPath),
                  ),
                  const SizedBox(width: 8),
                ],
              ),

              Row(
                children: [
                  if (showStatusButton)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        statusText,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: statusTextColor,
                        ),
                      ),
                    ),

                  const SizedBox(width: 6),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffCECECE), // ✅ border color
                        width: 0.6,                     // ✅ border width
                      ),
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Saved",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xff000000),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          size: 14,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Text(
                companyName,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: FrontendConfigs.kBlackColor,
                ),
              ),
              const Gap(5),
              Text(
                timeAgo,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff9A9A9A),
                ),
              ),
            ],
          ),

          Text(
            jobTitle,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: FrontendConfigs.kBlackColor,
            ),
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 8,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                  color: tag == "Full-Time"
                      ? const Color(0xff80D050)
                      : const Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 12,
                    color: tag == "Full-Time" ? Colors.white : Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff515151),
                  ),
                ),
              ),
            ],
          ),

          const Divider(),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Salary: $salary",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff000000),
                ),
              ),

              // 🔹 SHADOWLESS + BORDER-CONTROL BUTTON
              ElevatedButton(
                onPressed: onApply,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: buttonColor,
                  minimumSize: const Size(75, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ✅ Add this

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: buttonBorderColor,
                      width: buttonBorderWidth,
                    ),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: buttonTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
