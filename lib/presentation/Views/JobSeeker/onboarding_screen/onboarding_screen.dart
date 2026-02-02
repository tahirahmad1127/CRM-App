import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/register_screen.dart';
import 'package:crm_app/presentation/elements/my_button.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      imagePath: 'assets/images/onboarding_1.png',
      title: 'Job search & apply',
      description:
      'Lorem ipsum dolor sit amet consectetur. Libero consequat facilisis congue netus. Feugiat ultricies ut euismod tortor at varius ut.',
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding_2.png',
      title: 'Real-time workforce management',
      description:
      'Lorem ipsum dolor sit amet consectetur. Libero consequat facilisis congue netus. Feugiat ultricies ut euismod tortor at varius ut.',
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding_3.png',
      title: ' GPS time tracking',
      description:
      'Lorem ipsum dolor sit amet consectetur. Libero consequat facilisis congue netus. Feugiat ultricies ut euismod tortor at varius ut.',
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding_4.png',
      title: '  Messaging & notifications',
      description:
      'Lorem ipsum dolor sit amet consectetur. Libero consequat facilisis congue netus. Feugiat ultricies ut euismod tortor at varius ut.',
    ),
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to next screen (e.g., login/home)
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  void _skip() {
    // Navigate to next screen (e.g., login/home)
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: FrontendConfigs.kScaffoldBackgroundColor,
      body:Column(
          children: [
            SafeArea(
              child: Stack(
                children: [
                  // Centered logo
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo2.png',
                      height: 65,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Skip button at the right
                  Align(
                    alignment: Alignment.centerRight,
                    child: (_currentPage == _pages.length - 1)
                        ? SizedBox() // hide skip on last page
                        : TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: FrontendConfigs.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: FrontendConfigs.kPrimaryColor,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),

            // PageView with onboarding content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _pages[index]);
                },
              ),
            ),

            // Page indicator dots
            Padding(
              padding:  EdgeInsets.symmetric(vertical: screenHeight * 0.05),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: ScaleEffect(
                  activeDotColor: Color(0xff80D050),
                  dotColor: Color(0xffE9E9E9),
                  dotHeight: 12,
                  dotWidth: 12,
                  scale: 1.25, // Makes active dot ~1px bigger
                  spacing: 5,
                ),
              )
            ),
            MyContainer(
              onTap: () {
                if (_currentPage == _pages.length - 1) {
                  // Last page: Continue → navigate to RegisterScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                } else {
                  // Otherwise, go to next page
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 30),
              height: screenHeight * 0.07,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: FrontendConfigs.kPrimaryColor,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      (_currentPage == _pages.length - 1) ? 'Continue' : 'Next',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: FrontendConfigs.kScaffoldBackgroundColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.06),
                      child: Icon(
                        Icons.arrow_forward,
                        color: FrontendConfigs.kScaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            )

// Next button

          ],
        ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          data.imagePath,
          height: MediaQuery.of(context).size.height * 0.45,
          fit: BoxFit.contain,
        ),
         SizedBox(height: screenHeight * 0.02),

        // Title
        Text(
          data.title,
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: FrontendConfigs.kBlackColor,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        // Description
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            data.description,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color:  Color(0xff515151),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}