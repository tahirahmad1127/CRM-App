import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class BreakManagement extends StatefulWidget {
  const BreakManagement({super.key});

  @override
  State<BreakManagement> createState() => _BreakManagementState();
}

class _BreakManagementState extends State<BreakManagement> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  bool _isRunning = false;
  String _currentBreakType = '';
  int _totalPaidMinutes = 45;
  int _totalUnpaidMinutes = 10;
  String _lastBreakDuration = '00:30';

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  void _startPaidBreak() {
    setState(() {
      _isRunning = true;
      _currentBreakType = 'Paid';
    });
    _stopWatchTimer.onStartTimer();
  }

  void _startUnpaidBreak() {
    setState(() {
      _isRunning = true;
      _currentBreakType = 'Unpaid';
    });
    _stopWatchTimer.onStartTimer();
  }

  void _stopBreak() {
    _stopWatchTimer.onStopTimer();
    setState(() {
      _isRunning = false;
      _currentBreakType = '';
    });
    _stopWatchTimer.onResetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          'Break Managements',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Timer Circle
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF80D050),
                  width: 8,
                ),
              ),
              child: Center(
                child: StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: 0,
                  builder: (context, snapshot) {
                    final value = snapshot.data!;
                    final displayTime = StopWatchTimer.getDisplayTime(
                      value,
                      hours: true,
                      milliSecond: false,
                    );
                    return Text(
                      displayTime,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),

            // Conditional buttons based on timer state
            if (!_isRunning) ...[
              // Start Paid Break Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _startPaidBreak,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF80D050),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Start Paid Break',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Start Unpaid Break Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: _startUnpaidBreak,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF80D050), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Start Unpaid Break',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF80D050),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              // Choose break type text
              Text(
                'Choose break type to begin',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B6B6B),
                ),
              ),
            ] else ...[
              // Stop Break Button (when timer is running)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _stopBreak,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'End $_currentBreakType Break',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              // Current break type text
              Text(
                '$_currentBreakType break in progress',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Color(0xFF6B6B6B),
                ),
              ),
            ],
            SizedBox(height: 30),
            // Today Breaks Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today Breaks',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Total Paid Break
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Paid Break',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
                Text(
                  '$_totalPaidMinutes min',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Total Unpaid Break
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Unpaid Break',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
                Text(
                  '$_totalUnpaidMinutes min',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
              ],
            ),
            Gap(10),
            Divider(),
            Gap(10),

            // Last Break Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Break',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  _lastBreakDuration,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}