import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatefulWidget {
  final String logoPath;
  final String companyName;
  final String timeAgo;
  final String jobTitle;
  final List<String> tags;
  final String location;
  final String salary;
  final bool isSaved;
  final VoidCallback onApply;
  final VoidCallback? onTap;
  final double? width;

  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;

  final bool showStatusButton;
  final String statusText;
  final Color statusColor;
  final Color statusTextColor;

  final Color cardBorderColor;
  final double cardBorderWidth;

  final Color buttonBorderColor;
  final double buttonBorderWidth;

  final bool showOfferedButton;

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
    this.onTap,
    this.buttonText = "Apply Now",
    this.buttonColor = const Color(0xff80D050),
    this.buttonTextColor = Colors.white,
    this.showStatusButton = false,
    this.statusText = "",
    this.statusColor = const Color(0xff4A90E2),
    this.statusTextColor = Colors.white,
    this.cardBorderColor = const Color(0xff959595),
    this.cardBorderWidth = 0.6,
    this.buttonBorderColor = Colors.transparent,
    this.buttonBorderWidth = 0,
    this.showOfferedButton = false,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.cardBorderColor,
            width: widget.cardBorderWidth,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage(widget.logoPath),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  children: [
                    if (widget.showStatusButton)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: widget.statusColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.statusText,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: widget.statusTextColor,
                          ),
                        ),
                      ),
                    if (widget.showOfferedButton)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xff7E7E7E),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Offer Received",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const SizedBox(width: 6),

                    /// ✅ TOGGLE SAVED BUTTON
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSaved = !_isSaved;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffCECECE),
                            width: 0.6,
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
                              _isSaved
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              size: 14,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  widget.companyName,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: FrontendConfigs.kBlackColor,
                  ),
                ),
                const Gap(5),
                Text(
                  widget.timeAgo,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9A9A9A),
                  ),
                ),
              ],
            ),
            Text(
              widget.jobTitle,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: FrontendConfigs.kBlackColor,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              children: widget.tags.map((tag) {
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
                    widget.location,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff515151),
                    ),
                  ),
                ),
              ],
            ),
            Gap(10),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Salary: ${widget.salary}",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff000000),
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.onApply,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    backgroundColor: widget.buttonColor,
                    minimumSize: const Size(75, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                        color: widget.buttonBorderColor,
                        width: widget.buttonBorderWidth,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.buttonText,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: widget.buttonTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}