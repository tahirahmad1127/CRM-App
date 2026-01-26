import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/bottom_bar_screen.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  String selectedFilter = 'Full-Time';
  String selectedExperience = 'Entry Level';
  double _salaryEnd = 5000;
  SfRangeValues _salaryRange = const SfRangeValues(1000, 5000); // start fixed at 1.0k, end at 5.0k

  String? selectedCity = 'New York';

  final List<String> cities = [
    'New York',
    'London',
    'Paris',
    'Tokyo',
    'Berlin',
  ];

  final List<String> filters = [
    'Full-Time',
    'Part-Time',
    'Contract',
  ];

  final List<String> experience = [
    'Entry Level',
    'Mid Level',
    'Senior Level'
  ];

  TextEditingController searchController = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                  Text("Job Filter",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: FrontendConfigs.kBlackColor
                    ),
                  )
                ],
              ),
            ),
            Gap(screenHeight * 0.02),
            MyText(
              text: "Job Type",
              fontWeight: FontWeight.w600,
              size: 16,
              color: FrontendConfigs.kBlackColor,
            ),
            Gap(screenHeight * 0.025),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: filters.map((filter) {
                final isSelected = selectedFilter == filter;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.28,
                    height: screenHeight * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(0xff80D050)
                          : Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: isSelected
                            ? Color(0xff80D050)
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      filter,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Color(0xff9A9A9A),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Gap(screenHeight * 0.02),
            MyText(
              text: "Experience Level",
              fontWeight: FontWeight.w600,
              size: 16,
              color: FrontendConfigs.kBlackColor,
            ),
            Gap(screenHeight * 0.025),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: experience.map((experience) {
                final isSelected = selectedExperience == experience;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedExperience = experience;
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.28,
                    height: screenHeight * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(0xff80D050)
                          : Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: isSelected
                            ? Color(0xff80D050)
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      experience,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : Color(0xff9A9A9A),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Gap(screenHeight * 0.02),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Salary range text
                Text(
                  "Salary Range",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Gap(screenHeight * 0.02),

                // Start & End labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$1.0k",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                    Text(
                      "\$${(_salaryEnd / 1000).toStringAsFixed(1)}k",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: FrontendConfigs.kBlackColor,
                      ),
                    ),
                  ],
                ),

                // Slider
                SfSliderTheme(
                  data: SfSliderThemeData(
                    inactiveTrackHeight: 12,
                    activeTrackHeight: 12
                  ),
                  child: SfSlider(
                    min: 1000,
                    max: 5000,
                    value: _salaryEnd,
                    showTicks: false,
                    showLabels: false,
                    inactiveColor: const Color(0xFFDEFFCB),
                    activeColor: const Color(0xFF80D050),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _salaryEnd = newValue.toDouble();
                      });
                    },
                  ),
                ),
                Gap(screenHeight * 0.02),
                Text(
                  "Location",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(screenHeight * 0.02),
                DropdownButtonFormField<String>(
                  value: selectedCity,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xff6B6B6B),
                    fontWeight: FontWeight.w500,
                  ),
                  items: cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                ),
                Gap(screenHeight * 0.05),
                MyContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBar(),
                      ),
                    );
                  },
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 30),
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: FrontendConfigs.kPrimaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Apply filter",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: FrontendConfigs.kScaffoldBackgroundColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
