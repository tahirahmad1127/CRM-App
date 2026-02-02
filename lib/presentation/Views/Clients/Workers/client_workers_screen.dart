import 'package:crm_app/presentation/Views/Clients/Finance/finance_screen.dart';
import 'package:crm_app/presentation/Views/Clients/Workers/worker_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ClientWorkersScreen extends StatefulWidget {
  const ClientWorkersScreen({super.key});

  @override
  State<ClientWorkersScreen> createState() => _ClientWorkersScreenState();
}

class _ClientWorkersScreenState extends State<ClientWorkersScreen> {
  // String selectedPeriod = "Week";
  // String selectedPerformancePeriod = "Week";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Workers",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Workers List using ClientJobCard
            ClientJobCard(
              name: "John Doe",
              email: "johndoe@example.com",
              imageUrl: "assets/images/id_pic4.png", // optional
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkerDetailsScreen(),
                  ),
                );
              },
            ),
            ClientJobCard(
              name: "Jane Smith",
              email: "janesmith@example.com",
              imageUrl: "assets/images/id_pic4.png", // optional
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkerDetailsScreen(),
                  ),
                );
              },
            ),
            ClientJobCard(
              name: "Mike Johnson",
              email: "mikejohnson@example.com",
              imageUrl: "assets/images/id_pic4.png", // optional
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkerDetailsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // ============== COMMENTED OUT SECTIONS ==============

      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // Workers List Section
      //       Container(
      //         padding: const EdgeInsets.all(16),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(8),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black.withOpacity(0.08),
      //               blurRadius: 8,
      //               offset: const Offset(0, 2),
      //             ),
      //           ],
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               "Workers List",
      //               style: GoogleFonts.poppins(
      //                 fontWeight: FontWeight.w600,
      //                 fontSize: 16,
      //                 color: Colors.black,
      //               ),
      //             ),
      //             const Gap(16),
      //             SizedBox(
      //               height: 120,
      //               child: Center(
      //                 child: Text(
      //                   "No workers yet",
      //                   style: GoogleFonts.poppins(
      //                     fontSize: 14,
      //                     color: const Color(0xFF6B6B6B),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const Gap(16),
      //
      //       Divider(),
      //       const Gap(10),
      //
      //       // Attendance Chart Section
      //       Container(
      //         padding: const EdgeInsets.all(16),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(8),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black.withOpacity(0.08),
      //               blurRadius: 8,
      //               offset: const Offset(0, 2),
      //             ),
      //           ],
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   "Attendance Chart",
      //                   style: GoogleFonts.poppins(
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 14,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 Container(
      //                   height: 30,
      //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      //                   decoration: BoxDecoration(
      //                     color: const Color(0xffEFEFEF),
      //                     borderRadius: BorderRadius.circular(6),
      //                   ),
      //                   child: DropdownButtonHideUnderline(
      //                     child: DropdownButton<String>(
      //                       value: selectedPeriod,
      //                       icon: const Icon(
      //                         Icons.keyboard_arrow_down,
      //                         size: 16,
      //                         color: Color(0xFF6B6B6B),
      //                       ),
      //                       style: GoogleFonts.poppins(
      //                         fontWeight: FontWeight.w500,
      //                         fontSize: 12,
      //                         color: const Color(0xff515151),
      //                       ),
      //                       dropdownColor: const Color(0xffEFEFEF),
      //                       borderRadius: BorderRadius.circular(6),
      //                       items: ["Week", "Month", "Year"]
      //                           .map(
      //                             (item) => DropdownMenuItem<String>(
      //                         value: item,
      //                         child: Text(
      //                           item,
      //                           style: GoogleFonts.poppins(
      //                             fontWeight: FontWeight.w500,
      //                             fontSize: 12,
      //                             color: const Color(0xff515151),
      //                           ),
      //                         ),
      //                       ),
      //                     )
      //                           .toList(),
      //                       onChanged: (value) {
      //                         if (value != null) {
      //                           setState(() {
      //                             selectedPeriod = value;
      //                           });
      //                         }
      //                       },
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //             const Gap(16),
      //             SizedBox(
      //               height: 200,
      //               child: SfCartesianChart(
      //                 plotAreaBorderWidth: 0,
      //                 primaryXAxis: CategoryAxis(
      //                   majorGridLines: const MajorGridLines(
      //                     width: 0.5,
      //                     color: Color(0xFFE5E7EB),
      //                   ),
      //                   axisLine: const AxisLine(width: 0),
      //                   labelStyle: GoogleFonts.poppins(
      //                     fontSize: 0,
      //                     color: Colors.transparent,
      //                   ),
      //                 ),
      //                 primaryYAxis: NumericAxis(
      //                   minimum: 0,
      //                   maximum: 100,
      //                   interval: 20,
      //                   majorGridLines: const MajorGridLines(
      //                     width: 0.5,
      //                     color: Color(0xFFE5E7EB),
      //                   ),
      //                   axisLine: const AxisLine(width: 0),
      //                   labelFormat: '{value}%',
      //                   labelStyle: GoogleFonts.poppins(
      //                     fontSize: 10,
      //                     color: const Color(0xFF6B6B6B),
      //                   ),
      //                 ),
      //                 series: <CartesianSeries<ChartData, String>>[
      //                   SplineAreaSeries<ChartData, String>(
      //                     dataSource: [
      //                       ChartData('0', 40),
      //                       ChartData('1', 70),
      //                       ChartData('2', 50),
      //                       ChartData('3', 85),
      //                       ChartData('4', 60),
      //                       ChartData('5', 75),
      //                       ChartData('6', 55),
      //                     ],
      //                     xValueMapper: (ChartData data, _) => data.x,
      //                     yValueMapper: (ChartData data, _) => data.y,
      //                     gradient: LinearGradient(
      //                       colors: [
      //                         const Color(0xFF80D050).withOpacity(0.2),
      //                         const Color(0xFF80D050).withOpacity(0.0),
      //                       ],
      //                       begin: Alignment.topCenter,
      //                       end: Alignment.bottomCenter,
      //                     ),
      //                     borderColor: const Color(0xFF80D050),
      //                     borderWidth: 2,
      //                     markerSettings: const MarkerSettings(
      //                       isVisible: false,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const Gap(16),
      //
      //       // Activity Chart and Performance Rating Row
      //       Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Expanded(
      //             child: Container(
      //               padding: const EdgeInsets.all(10),
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.circular(8),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.black.withOpacity(0.08),
      //                     blurRadius: 8,
      //                     offset: const Offset(0, 2),
      //                   ),
      //                 ],
      //               ),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "Activity Chart",
      //                     style: GoogleFonts.poppins(
      //                       fontWeight: FontWeight.w600,
      //                       fontSize: 12,
      //                       color: Colors.black,
      //                     ),
      //                   ),
      //                   const Gap(10),
      //                   SizedBox(
      //                     height: 140,
      //                     child: Stack(
      //                       alignment: Alignment.center,
      //                       children: [
      //                         SfCircularChart(
      //                           margin: EdgeInsets.zero,
      //                           series: <CircularSeries>[
      //                             DoughnutSeries<PieData, String>(
      //                               dataSource: [
      //                                 PieData('Idle', 30, const Color(0xff80D050).withOpacity(0.2)),
      //
      //                                 PieData('Productive', 70, const Color(0xFF80D050)),
      //                               ],
      //                               xValueMapper: (PieData data, _) => data.category,
      //                               yValueMapper: (PieData data, _) => data.value,
      //                               pointColorMapper: (PieData data, _) => data.color,
      //                               innerRadius: '70%',
      //                               radius: '100%',
      //                               dataLabelSettings: const DataLabelSettings(
      //                                 isVisible: false,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Text(
      //                               "70%",
      //                               style: GoogleFonts.poppins(
      //                                 fontWeight: FontWeight.w600,
      //                                 fontSize: 22,
      //                                 color: Colors.black,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   const Gap(12),
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       _buildLegendItem("Productive Time", const Color(0xFF80D050)),
      //                       _buildLegendItem("Idle Time", const Color(0xFFE6F6DC)),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           const Gap(16),
      //
      //           // Performance Rating
      //           Expanded(
      //             child: Container(
      //               padding: const EdgeInsets.all(10),
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.circular(8),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.black.withOpacity(0.08),
      //                     blurRadius: 8,
      //                     offset: const Offset(0, 2),
      //                   ),
      //                 ],
      //               ),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         "Performance Rating",
      //                         style: GoogleFonts.poppins(
      //                           fontWeight: FontWeight.w600,
      //                           fontSize: 12,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Gap(5),
      //                   Center(child: Image.asset('assets/images/star.png',
      //                   width: 30,
      //                   )),
      //                   Center(
      //                     child: Text(
      //                       "4.5",
      //                       style: GoogleFonts.poppins(
      //                         fontWeight: FontWeight.w600,
      //                         fontSize: 22,
      //                         color: Colors.black,
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 100,
      //                     child: SfCartesianChart(
      //                       plotAreaBorderWidth: 0,
      //                       primaryXAxis: CategoryAxis(
      //                         isVisible: false,
      //                       ),
      //                       primaryYAxis: NumericAxis(
      //                         isVisible: false,
      //                         minimum: 0,
      //                         maximum: 5,
      //                       ),
      //                       series: <CartesianSeries<ChartData, String>>[
      //                         SplineAreaSeries<ChartData, String>(
      //                           dataSource: [
      //                             ChartData('0', 3.5),
      //                             ChartData('1', 4.2),
      //                             ChartData('2', 3.8),
      //                             ChartData('3', 4.5),
      //                             ChartData('4', 4.0),
      //                             ChartData('5', 4.3),
      //                           ],
      //                           xValueMapper: (ChartData data, _) => data.x,
      //                           yValueMapper: (ChartData data, _) => data.y,
      //                           gradient: LinearGradient(
      //                             colors: [
      //                               const Color(0xFF80D050).withOpacity(0.2),
      //                               const Color(0xFF80D050).withOpacity(0.0),
      //                             ],
      //                             begin: Alignment.topCenter,
      //                             end: Alignment.bottomCenter,
      //                           ),
      //                           borderColor: const Color(0xFF80D050),
      //                           borderWidth: 2,
      //                           markerSettings: const MarkerSettings(
      //                             isVisible: false,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

// Widget _buildLegendItem(String label, Color color) {
//   return Row(
//     children: [
//       Container(
//         width: 8,
//         height: 8,
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.rectangle,
//         ),
//       ),
//       const Gap(4),
//       Text(
//         label,
//         style: GoogleFonts.poppins(
//           fontSize: 10,
//           color: const Color(0xFF6B6B6B),
//         ),
//       ),
//     ],
//   );
// }
}

// class ChartData {
//   ChartData(this.x, this.y);
//   final String x;
//   final double y;
// }
//
// class PieData {
//   PieData(this.category, this.value, this.color);
//   final String category;
//   final double value;
//   final Color color;
// }


// ============== NEW CLIENT JOB CARD ==============

class ClientJobCard extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;
  final VoidCallback? onTap;

  const ClientJobCard({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff959595), width: 0.6),
        ),
        child: Row(
          children: [
            // Profile Image
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 50,
                height: 50,
                color: Color(0xffE0E0E0),
                child: imageUrl != null
                    ? Image.asset(imageUrl!, fit: BoxFit.cover)
                    : Icon(Icons.person, size: 30, color: Colors.grey),
              ),
            ),
            Gap(12),

            // Name and Email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Gap(2),
                  Text(
                    email,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                ],
              ),
            ),

            // Arrow Forward Icon
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xff6B6B6B),
            ),
          ],
        ),
      ),
    );
  }
}