import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ClockIn extends StatefulWidget {
  const ClockIn({super.key});

  @override
  State<ClockIn> createState() => _ClockInState();
}

class _ClockInState extends State<ClockIn> {
  static const LatLng _initialPosition = LatLng(33.5651, 73.0169); // Rawalpindi coordinates
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};

  // Shift tracking
  bool _isShiftStarted = false;
  DateTime? _clockInTime;
  DateTime? _clockOutTime;

  // Break tracking
  bool _isBreakStarted = false;
  DateTime? _breakStartTime;
  DateTime? _breakEndTime;
  Duration _totalBreakDuration = Duration.zero;

  // Timer for live break duration
  Timer? _breakTimer;
  Duration _currentBreakDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() async {
    try {
      // Using custom image as marker
      final BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(20, 20)),
        'assets/images/maps_marker.png',
      );

      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('current_location'),
            position: _initialPosition,
            icon: customIcon,
          ),
        );
      });
    } catch (e) {
      print('Error loading marker image: $e');
      // Fallback to default marker
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('current_location'),
            position: _initialPosition,
          ),
        );
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _toggleShift() {
    setState(() {
      if (_isShiftStarted) {
        // End shift
        _clockOutTime = DateTime.now();
        _isShiftStarted = false;

        // Reset break if it was running
        if (_isBreakStarted) {
          _stopBreakTimer();
          _isBreakStarted = false;
        }
      } else {
        // Start shift
        _clockInTime = DateTime.now();
        _clockOutTime = null;
        _isShiftStarted = true;

        // Reset break tracking
        _totalBreakDuration = Duration.zero;
        _currentBreakDuration = Duration.zero;
        _breakStartTime = null;
        _breakEndTime = null;
      }
    });
  }

  void _toggleBreak() {
    if (!_isShiftStarted) return; // Can't take break if shift hasn't started

    setState(() {
      if (_isBreakStarted) {
        // End break
        _stopBreakTimer();
        _breakEndTime = DateTime.now();
        if (_breakStartTime != null) {
          _totalBreakDuration += _breakEndTime!.difference(_breakStartTime!);
        }
        _isBreakStarted = false;
        _currentBreakDuration = Duration.zero;
      } else {
        // Start break
        _breakStartTime = DateTime.now();
        _isBreakStarted = true;
        _startBreakTimer();
      }
    });
  }

  void _startBreakTimer() {
    _breakTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_breakStartTime != null) {
        setState(() {
          _currentBreakDuration = DateTime.now().difference(_breakStartTime!);
        });
      }
    });
  }

  void _stopBreakTimer() {
    _breakTimer?.cancel();
    _breakTimer = null;
  }

  String _formatTime(DateTime? time) {
    if (time == null) return '--:--';
    return DateFormat('h:mma').format(time);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  Duration _getTotalBreakDuration() {
    return _totalBreakDuration + _currentBreakDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildGoogleMap(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                _buildBottomCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Google map widget
  Widget _buildGoogleMap() {
    return GoogleMap(
      key: const ValueKey('clock_in_map'),
      initialCameraPosition: const CameraPosition(
        target: _initialPosition,
        zoom: 15.0,
      ),
      onMapCreated: _onMapCreated,
      polylines: _polylines,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      markers: _markers,
    );
  }

  /// Bottom card with clock in details
  Widget _buildBottomCard() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Green Section - Buttons
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff80D050),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Buttons Row
                  Row(
                    children: [
                      // Start/End Shift Button (Half width)
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _toggleShift,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              _isShiftStarted ? 'End Shift' : 'Start Shift',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _isShiftStarted
                                    ? Color(0xffEC1C24)
                                    : Color(0xff80D050),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Show Start/End Break Button only when shift is started
                      if (_isShiftStarted) ...[
                        SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _toggleBreak,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                _isBreakStarted ? 'End Break' : 'Start Break',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: _isBreakStarted
                                      ? Color(0xffEC1C24)
                                      : Color(0xff80D050),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Gap(12),

                  Text(
                    'Photo verification require after taping start',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // White Section - Today Schedule
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today Schedule',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Gap(10),

                // Clock In Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Clock In Time',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    Text(
                      _formatTime(_clockInTime),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                  ],
                ),
                Gap(10),

                // Clock Out Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Clock Out Time',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    Text(
                      _formatTime(_clockOutTime),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                  ],
                ),
                Gap(10),

                Divider(),
                Gap(10),

                // Break Duration (with live timer)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Break Duration',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                    Text(
                      _formatDuration(_getTotalBreakDuration()),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B6B6B),
                      ),
                    ),
                  ],
                ),
                Gap(10),

                Divider(),
                Gap(10),

                // Total Hours
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Hours',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff9A9A9A),
                      ),
                    ),
                    Text(
                      '00:12:20',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff9A9A9A),
                      ),
                    ),
                  ],
                ),
                Gap(10),

                // Remaining Hours
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remaining Hours',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff9A9A9A),
                      ),
                    ),
                    Text(
                      '00:2:20',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff9A9A9A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _stopBreakTimer();
    _mapController?.dispose();
    super.dispose();
  }
}