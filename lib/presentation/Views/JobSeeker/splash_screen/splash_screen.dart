import 'dart:async';
import 'package:crm_app/presentation/Views/JobSeeker/onboarding_screen/onboarding_screen.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(), // 🔹 Replace with your screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff80D050), Color(0xff388F20)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                imagePath: 'assets/images/crm_logo.png',
                width: screenWidth * 0.8,
              ),
              const SizedBox(height: 12),
              MyText(
                text: "Recruitment • Workforce • Management",
                size: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xffFFFFFF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
