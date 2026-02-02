import 'package:country_picker/country_picker.dart';
import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/login_screen.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Auth/profile_picture.dart';
import 'package:crm_app/presentation/elements/common_image_view.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_text_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';


class SignupScreen extends StatefulWidget {
  final String selectedRole; // Add this parameter

  const SignupScreen({
    super.key,
    required this.selectedRole, // Make it required
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObscured = true;

  Country? selectedCountry;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
  TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default country to US
    selectedCountry = Country(
      phoneCode: '1',
      countryCode: 'US',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'United States',
      example: '2015550123',
      displayName: 'United States',
      displayNameNoCountryCode: 'United States',
      e164Key: '',
    );
    phoneController.text = '+1 '; // prefill with US code
  }

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
            /// ================= HEADER (FULL WIDTH) =================
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: SizedBox(
                height: 65,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.arrow_left),
                      ),
                    ),
                    Center(
                      child: CommonImageView(
                        imagePath: 'assets/images/logo2.png',
                        height: 65,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ================= BODY (UNCHANGED) =================
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
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
                        text: "Sign in to your account by enter a\ngiven detail.",
                        fontWeight: FontWeight.w400,
                        size: 12,
                        color: Color(0xff515151),
                      ),
                      Gap(screenHeight * 0.02),

                      // Full Name
                      MyText(
                        text: "Full name",
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        controller: nameController,
                        hintText: "Roman tor",
                        keyboardType: TextInputType.name,
                      ),
                      Gap(screenHeight * 0.02),

                      // Email
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
                      ),
                      Gap(screenHeight * 0.02),

                      // Phone Number
                      MyText(
                        text: "Phone Number",
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),

                      Row(
                        children: [
                          // Phone Input Field (70%)
                          Flexible(
                            flex: 7,
                            child: Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xff515151),
                                  width: 0.8,
                                ),
                              ),
                              child: Row(
                                children: [
                                  // Country selector
                                  GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        showPhoneCode: true,
                                        onSelect: (Country country) {
                                          setState(() {
                                            selectedCountry = country;
                                            String code =
                                                '+${country.phoneCode} ';
                                            if (!phoneController.text.startsWith(
                                              code,
                                            )) {
                                              phoneController.text = code;
                                              phoneController.selection =
                                                  TextSelection.fromPosition(
                                                    TextPosition(
                                                      offset: phoneController
                                                          .text
                                                          .length,
                                                    ),
                                                  );
                                            }
                                          });
                                        },
                                        countryListTheme: CountryListThemeData(
                                          flagSize: 25,
                                          textStyle: TextStyle(fontSize: 16),
                                          bottomSheetHeight: 500,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          if (selectedCountry != null)
                                            Text(
                                              selectedCountry!.flagEmoji,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          if (selectedCountry != null)
                                            if (selectedCountry != null)
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Color(0xff515151),
                                              ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Actual TextField
                                  Expanded(
                                    child: TextField(
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff515151),
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "1234567",
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffB8BABF),
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 10),

                          // Send OTP Button using MyContainer (same height)
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 56, // exactly same as TextField
                              child: MyContainer(
                                onTap: () {},
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0xff515151),
                                    width: 0.6,
                                  ),
                                ),
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Gap(screenHeight * 0.02), // Password
                      MyText(
                        text: "Password",
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        hintText: "*******",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff515151),
                        ),
                        controller: passwordController,
                        isPasswordField: true,
                        isSecure: isObscured,
                        isSuffixIcon: true,
                        suffixIcon: Icon(
                          isObscured
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_fill,
                          color: Color(0xff515151),
                          size: 20,
                        ),
                        onSuffixTap: () =>
                            setState(() => isObscured = !isObscured),
                      ),
                      Gap(screenHeight * 0.02), // Password
                      MyText(
                        text: "Confirm Password",
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                      Gap(screenHeight * 0.01),
                      MyTextField(
                        height: 56,
                        hintText: "*******",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff515151),
                        ),
                        controller: passwordController,
                        isPasswordField: true,
                        isSecure: isObscured,
                        isSuffixIcon: true,
                        suffixIcon: Icon(
                          isObscured
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_fill,
                          color: Color(0xff515151),
                          size: 20,
                        ),
                        onSuffixTap: () =>
                            setState(() => isObscured = !isObscured),
                      ),

                      Gap(screenHeight * 0.03),
                      MyContainer(
                        onTap: () {
                          // Pass the role to ProfilePicture
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePicture(selectedRole: widget.selectedRole),
                            ),
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
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Next",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: FrontendConfigs.kScaffoldBackgroundColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              text: "Already have an account",
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: Color(0xff6B6B6B),
                            ),
                            Gap(5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreen(), // or your registration screen
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
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
                          ],
                        ),
                      ),
                    ],
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