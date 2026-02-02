import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Chat/Chat_list_tile_template.dart';
import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Chat/inside_chat.dart';
import 'package:crm_app/presentation/elements/job_card_template.dart';
import 'package:crm_app/presentation/elements/my_container_widget.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      body: SingleChildScrollView(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
              child: Text(
                "Chat",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: FrontendConfigs.kBlackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20,),
              child: Column(
                children: [
                  MyTextField(
                    controller: searchController,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xfCECECE),
                          width: 0.4,
                        )
                    ),
                    width: screenWidth * 0.9,
                    labelText: "Search...",
                    hintColor: Color(0xff6B6B6B),
                    fontWeight: FontWeight.w500,
                    prefixIcon: Image.asset('assets/images/search.png'),
                    backgroundColor: Color(0xffF5F5F5),
                  ),
                  Gap(screenHeight * 0.02),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/11/24',
                    showDot: true, // Set to false to hide the dot
                  ),
                  Divider(),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: true, // Set to false to hide the dot
                  ),
                  Divider(),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: true, // Set to false to hide the dot
                  ),
                  Divider(),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: true, // Set to false to hide the dot
                  ),
                  Divider(),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: false, // Set to false to hide the dot
                  ),
                  Divider(),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: false, // Set to false to hide the dot
                  ),
                  Divider(),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: false, // Set to false to hide the dot
                  ),
                  Divider(),
                  Gap(screenHeight * 0.02),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: false, // Set to false to hide the dot
                  ),
                  Divider(),
                  Gap(screenHeight * 0.02),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: false, // Set to false to hide the dot
                  ),
                  Divider(),
                  Gap(screenHeight * 0.02),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: false, // Set to false to hide the dot
                  ),
                  Divider(),
                  Gap(screenHeight * 0.02),
                  CustomListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InsideChat()));
                    },
                    imagePath: 'assets/images/id_pic2.png',
                    name: 'Cecelio Cremin',
                    subtitle: 'Lorem ipsum dolor sit amet...',
                    date: '23/12/24',
                    showDot: false, // Set to false to hide the dot
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
