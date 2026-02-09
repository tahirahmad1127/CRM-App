import 'package:crm_app/presentation/Views/JobSeeker/Bottom_Bar/Profile/Setting/Further%20Screens/portfolio/add_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 4 Dummy projects to complete the grid
    final List<Map<String, String>> dummyItems = [
      {
        'title': 'Project Alpha',
        'desc': 'A comprehensive redesign of the corporate dashboard focusing on user engagement and data visualization for real-time analytics tracking.'
      },
      {
        'title': 'Mobile Banking',
        'desc': 'Developed a secure, high-performance mobile banking application with biometric authentication and instant fund transfer capabilities.'
      },
      {
        'title': 'E-Comm Web',
        'desc': 'An end-to-end e-commerce platform built for high scalability, featuring an AI-driven recommendation engine and seamless payment gateway.'
      },
      {
        'title': 'AI Assistant',
        'desc': 'A cross-platform productivity tool that integrates with calendar APIs to automatically schedule meetings and manage daily tasks efficiently.'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Portfolio',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
          childAspectRatio: 0.68, // Adjusted height to fit Title + 3-line description
        ),
        itemCount: dummyItems.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with centered Title overlay
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/github_icon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black38, // Slight dark overlay for readability
                      child: Text(
                        dummyItems[index]['title']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              // NEW: Bold Black Title Below Image
              Text(
                dummyItems[index]['title']!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700, // Bold
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(4),
              // Description with 3-line limit
              Text(
                dummyItems[index]['desc']!,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff6B6B6B),
                ),
                maxLines: 3, // Exactly 3 lines
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF80D050),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddPortfolioScreen()),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}