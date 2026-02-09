import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/select_role.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/signup_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Home/home_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/bottom_bar_screen.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscured = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(CupertinoIcons.arrow_left),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: CommonImageView(
                        imagePath: 'assets/images/logo2.png',
                        height: 65,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Step Into Your\nNext Opportunity",
                      fontWeight: FontWeight.w600,
                      size: 24,
                      color: Color(0xff0F0F0F),
                    ),
                    Gap(screenHeight * 0.02),
                    MyText(
                      text:
                      "Sign in to your account by enter a\ngiven detail.",
                      fontWeight: FontWeight.w400,
                      size: 12,
                      color: Color(0xff515151),
                    ),
                    Gap(screenHeight * 0.02),
                    MyText(
                      text: "Email",
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                    Gap(screenHeight * 0.01),
                    MyTextField(
                        height: 56,
                        controller: emailController,
                        hintText: "Example@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                        onTap: () {
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          if (email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please fill all fields")),
                            );
                            return;
                          }
                        }),
                    Gap(screenHeight * 0.02),
                    MyText(
                      text: "Password",
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                    Gap(screenHeight * 0.01),

                    TextField(
                      controller: passwordController,
                      obscureText: isObscured,
                      obscuringCharacter: "●",
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "*******",
                        hintStyle: TextStyle(
                          color: Color(0xffB8BABF),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.black, width: 0.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.black, width: 0.6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.black, width: 0.6),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              isObscured
                                  ? CupertinoIcons.eye_slash_fill
                                  : CupertinoIcons.eye_solid,
                              color: Color(0xff9F9F9F),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),

                    Gap(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: FrontendConfigs.kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor:
                          FrontendConfigs.kPrimaryColor,
                          decorationThickness: 1,
                        ),
                      ),
                    ),
                    Gap(screenHeight * 0.02),
                    MyContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomBar()),
                        );
                      },
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 15),
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: FrontendConfigs.kPrimaryColor,
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: FrontendConfigs.kScaffoldBackgroundColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 👇 Pushed to bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectRole(),
                    ),
                  );
                },
                child: Text(
                  'Create an account',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: FrontendConfigs.kPrimaryColor,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: FrontendConfigs.kPrimaryColor,
                    decorationThickness: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
