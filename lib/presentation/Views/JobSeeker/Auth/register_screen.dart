import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/login_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/select_role.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/signup_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/bottom_bar_screen.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_button.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            // Logo stays at the top
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CommonImageView(
                  imagePath: 'assets/images/logo2.png',
                  height: 65,
                ),
              ),
            ),

            // Expanded to take remaining space
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // buttons in center
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                    btnLabel: "Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  MyButton(
                    btnLabel: "Create an account",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelectRole()),
                      );
                    },
                    color: Colors.white,
                    textColor: FrontendConfigs.kPrimaryColor,
                    border: Border.all(color: FrontendConfigs.kPrimaryColor),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomBar()));

                    },
                    child: MyText(
                      text: "Continue as Guest",
                      color: const Color(0xff000000),
                      size: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
