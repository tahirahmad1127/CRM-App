import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class BusinessProfile extends StatefulWidget {
  const BusinessProfile({super.key});

  @override
  State<BusinessProfile> createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  String? selectedTimesheet;
  String? selectedReason;
  final TextEditingController NameController = TextEditingController();
  final TextEditingController LocationController = TextEditingController();

  final TextEditingController EmailController = TextEditingController();


  @override
  void dispose() {
    NameController.dispose();
    LocationController.dispose();
    EmailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Business Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(8),

            // Select Timesheet
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Business Name',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff959595), width: 0.6),
                  ),
                  child: TextField(
                    controller: NameController,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Business name',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      border: InputBorder.none, // Removes default border
                    ),
                  ),
                ),
              ],
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff959595), width: 0.6),
                  ),
                  child: TextField(
                    controller: LocationController,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Location',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      border: InputBorder.none, // Removes default border
                    ),
                  ),
                ),
              ],
            ),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email/Phone number',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                Gap(8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff959595), width: 0.6),
                  ),
                  child: TextField(
                    controller: EmailController,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Example23@gmail.com',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      border: InputBorder.none, // Removes default border
                    ),
                  ),
                ),
              ],
            ),
            Gap(16),
            Text(
              'Upload Logo',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff6B6B6B),
              ),
            ),

            Gap(8),
            // Upload Container
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xff959595), width: 0.6),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          print('Image selected: ${image.path}');
                          // You can store the selected image in a state variable if needed
                        }
                      },
                      icon: Image.asset(
                        'assets/images/leads_upload.png',
                        width: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Gap(40),

            // Start Paid Break Button
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF80D050),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Save',
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
    );
  }
}
