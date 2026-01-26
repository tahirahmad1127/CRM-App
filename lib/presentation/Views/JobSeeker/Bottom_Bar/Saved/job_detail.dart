import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/job_details_template.dart';
import 'package:crm_app/presentation/elements/my_button.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  TextEditingController searchController = TextEditingController();

  static const LatLng _initialPosition = LatLng(33.6844, 73.0479);
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      key: const ValueKey('client_arriving_map'),
      initialCameraPosition: const CameraPosition(
        target: _initialPosition,
        zoom: 15.0,
      ),
      onMapCreated: _onMapCreated,
      polylines: _polylines,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      markers: _markers,
      tiltGesturesEnabled: true,
      zoomGesturesEnabled: true,
      compassEnabled: false,
      mapToolbarEnabled: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 HEADER (fixed)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(CupertinoIcons.arrow_left),
                    ),
                  ),
                  Text(
                    "Job Detail",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: FrontendConfigs.kBlackColor,
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 SCROLLABLE CONTENT ONLY BELOW HEADER
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    JobDetails(
                      imagePath: 'assets/images/id_pic.png',
                      jobTitle: 'Senior Industrial Manager',
                      companyName: 'BELLE',
                      timeAgo: '2hr Ago',
                    ),
                    Gap(screenHeight * 0.02),

                    Text(
                      "Job Description",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                    Gap(screenHeight * 0.01),

                    Text(
                      "We are seeking an experienced Senior Industrial Manager to oversee production operations, optimize manufacturing processes, and ensure the highest standards of efficiency and safety. The ideal candidate will lead cross-functional teams, drive continuous improvement initiatives, and contribute to long-term strategic planning within the organization.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                    Gap(screenHeight * 0.02),

                    Text(
                      "Responsibilities",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                    Gap(screenHeight * 0.01),

                    Text(
                      "• Oversee daily manufacturing and production operations across multiple units  • Lead, mentor, and evaluate production supervisors and operational teams  • Develop and implement strategies to improve productivity, quality, and cost efficiency  • Monitor key performance indicators (KPIs) and operational metrics  • Coordinate with engineering teams to introduce new machinery and optimize workflows  • Ensure strict compliance with safety, quality, and regulatory standards  • Manage production schedules, resource allocation, and inventory levels  • Identify and resolve operational bottlenecks using data-driven insights  • Collaborate with senior leadership on budgeting and long-term planning  • Drive continuous improvement initiatives using Lean, Six Sigma, or similar methodologies",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: FrontendConfigs.kBlackColor,
                          height: 1.7),
                    ),
                    Gap(screenHeight * 0.02),

                    Text(
                      "Requirements",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                    Gap(screenHeight * 0.01),

                    Text(
                      "• Bachelor’s or Master’s degree in Industrial Engineering, Manufacturing, Operations Management, or related field  • 7+ years of experience in industrial, manufacturing, or plant management roles  • Proven track record of leading large teams in a fast-paced production environment  • Strong knowledge of Lean Manufacturing, Six Sigma, and process optimization  • Excellent leadership, communication, and decision-making skills  • Ability to analyze data, interpret reports, and drive results  • Experience working with ERP systems and production-planning tools  • Strong understanding of workplace safety standards and regulatory compliance  • Ability to manage budgets, timelines, and cross-departmental collaboration",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: FrontendConfigs.kBlackColor,
                          height: 1.7),
                    ),
                    Gap(screenHeight * 0.02),

                    Text(
                      "Location",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                    Gap(screenHeight * 0.02),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MyContainer(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.25,
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                        child: _buildGoogleMap(),
                      ),
                    ),
                    Gap(screenHeight * 0.02),

                    Row(
                      children: [
                        Image.asset("assets/images/money_icon.png", width: 24),
                        Gap(5),
                        Text(
                          "Salary: \$4.0k",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: FrontendConfigs.kBlackColor,
                          ),
                        ),
                      ],
                    ),
                    Gap(screenHeight * 0.02),

                    Row(
                      children: [
                        MyButton(
                          btnLabel: "Apply Now",
                          onPressed: () {},
                          width: screenWidth * 0.433,
                        ),
                        SizedBox(width: screenHeight * 0.01),
                        MyButton(
                          btnLabel: "Add to saved",
                          width: screenWidth * 0.433,
                          onPressed: () {},
                          color: Colors.white,
                          textColor: FrontendConfigs.kPrimaryColor,
                          border: Border.all(
                              color: FrontendConfigs.kPrimaryColor),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
