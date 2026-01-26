import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyHoursChart extends StatelessWidget {
  final List<ChartData> chartData;
  final bool showChart;

  const WeeklyHoursChart({
    Key? key,
    required this.chartData,
    this.showChart = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showChart) return SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xff959595)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly hours worked',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
            ),
          ),
          Gap(20),
      SizedBox(
        height: 130,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
            labelStyle: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 12,
            interval: 4,
            majorGridLines: MajorGridLines(
              width: 1,
              color: Color(0xffE0E0E0), // Faint grey lines
            ),
            axisLine: AxisLine(width: 0),
            labelStyle: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff6B6B6B),
            ),
          ),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.day,
              yValueMapper: (ChartData data, _) => data.hours,
              color: Color(0xff80D050), // All bars green
              width: 0.8,
              spacing: 0.2,
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}

class ChartData {
  final String day;
  final double hours;
  final Color color;

  ChartData(this.day, this.hours, this.color);
}
