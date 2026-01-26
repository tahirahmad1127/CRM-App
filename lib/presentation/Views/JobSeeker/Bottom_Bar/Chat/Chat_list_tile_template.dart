import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;
  final String date;
  final bool showDot;
  final VoidCallback? onTap; // 👈 Add this

  const CustomListTile({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.date,
    this.showDot = false,
    this.onTap, // 👈 Add this
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( // 👈 Wrap with InkWell
      onTap: onTap,
      borderRadius: BorderRadius.circular(8), // Optional: adds ripple effect border
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 10),

            // Name and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0E0E0E),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7E7E7E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Date and Dot
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                const SizedBox(height: 4),
                if (showDot)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xff1E1E1E),
                      shape: BoxShape.circle,
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