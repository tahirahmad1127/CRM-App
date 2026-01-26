import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ClientsHomeScreen extends StatefulWidget {
  const ClientsHomeScreen({super.key});

  @override
  State<ClientsHomeScreen> createState() => _ClientsHomeScreenState();
}

class _ClientsHomeScreenState extends State<ClientsHomeScreen> {

  String selectedPeriod = "Week";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/profile_pic.png", width: 60),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Morgan mills",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Good Morning",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/leading_icon.png",
                        width: 20,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Gap(10),
                  Container(
                    width: 40,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/bell.png",
                        width: 20,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),

            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(

                    label: "Active Jobs",
                    value: "18",
                    iconPath: "assets/images/post_job.png",
                  ),
                ),
                Gap(12),
                Expanded(
                  child: _buildStatCard(
                    label: "Worker Assigned",
                    value: "18",
                    iconPath: "assets/images/manage_workers.png",
                  ),
                ),
              ],
            ),
            Gap(12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    label: "Timesheet Pending\nApproval",
                    value: "5",
                    iconPath: "assets/images/track_hours.png",
                  ),
                ),
                Gap(12),
                Expanded(
                  child: _buildStatCard(
                    label: "Invoice Pending",
                    value: "6",
                    iconPath: "assets/images/payments.png",
                  ),
                ),
              ],
            ),

            Gap(24),

            // Analytics & Insights Section
            Text(
              "Analytics & Insights",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
            ),

            Gap(16),

            // Attendance Chart Container
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Attendance Chart",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xffEFEFEF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedPeriod,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                              color: Color(0xFF6B6B6B),
                            ),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color(0xff515151),
                            ),
                            dropdownColor: const Color(0xffEFEFEF),
                            borderRadius: BorderRadius.circular(6),
                            items: ["Week", "Month", "Year"]
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xff515151),
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedPeriod = value;
                                });
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(16),
                  SizedBox(
                    height: 200,
                    child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      primaryXAxis: CategoryAxis(
                        majorGridLines: MajorGridLines(
                          width: 0.5,
                          color: Color(0xFFE5E7EB),
                        ),
                        axisLine: AxisLine(width: 0),
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 0,
                          color: Colors.transparent,
                        ),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 100,
                        interval: 20,
                        majorGridLines: MajorGridLines(
                          width: 0.5,
                          color: Color(0xFFE5E7EB),
                        ),
                        axisLine: AxisLine(width: 0),
                        labelFormat: '{value}%',
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      series: <CartesianSeries<ChartData, String>>[
                        SplineAreaSeries<ChartData, String>(
                          dataSource: [
                            ChartData('0', 40),
                            ChartData('1', 70),
                            ChartData('2', 50),
                            ChartData('3', 85),
                            ChartData('4', 60),
                            ChartData('5', 75),
                            ChartData('6', 55),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF80D050).withOpacity(0.2),
                              Color(0xFF80D050).withOpacity(0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderColor: Color(0xFF80D050),
                          borderWidth: 2,
                          markerSettings: MarkerSettings(
                            isVisible: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Gap(16),

            // Performance Section
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Performance",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Gap(12),

                  // Performance Chart
                  SizedBox(
                    height: 190,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          horizontalInterval: 2,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Color(0xFFD2D5DB),
                              strokeWidth: 0.4,
                            );
                          },
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                                if (value.toInt() >= 0 && value.toInt() < days.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 4, ),
                                    child: Text(
                                      days[value.toInt()],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        minX: 0,
                        maxX: 6,
                        minY: 0,
                        maxY: 10,
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(1, 4),
                              FlSpot(2, 5),
                              FlSpot(3, 5),
                              FlSpot(4, 6),
                              FlSpot(5, 7),
                              FlSpot(6, 6),
                            ],
                            isCurved: true,
                            color: Color(0xFF80D050),
                            barWidth: 3,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: true,
                              checkToShowDot: (spot, barData) {
                                return spot.x == 2;
                              },
                              getDotPainter: (spot, percent, barData, index) {
                                return FlDotCirclePainter(
                                  radius: 4,
                                  color: Color(0xFF80D050),
                                  strokeWidth: 2,
                                  strokeColor: Colors.white,
                                );
                              },
                            ),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF80D050).withOpacity(0.3),
                                  Color(0xFF80D050).withOpacity(0.0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            getTooltipColor: (touchedSpot) => Color(0xFF80D050),
                            tooltipRoundedRadius: 8,
                            tooltipPadding: EdgeInsets.all(8),
                            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                              return touchedBarSpots.map((barSpot) {
                                return LineTooltipItem(
                                  '${barSpot.y.toInt()}h',
                                  GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Gap(20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required String label, required String value, required String iconPath}) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(iconPath, height: 30),
              Gap(8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.4,
                  color: Color(0xFF6B6B6B),
                ),
              ),
            ],
          ),
          Gap(4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}