import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:crm_app/presentation/elements/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class InsideChat extends StatefulWidget {
  const InsideChat({super.key});

  @override
  State<InsideChat> createState() => _InsideChatState();
}

class _InsideChatState extends State<InsideChat> {
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(CupertinoIcons.arrow_left, size: 24),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/id_pic2.png'),
                ),
                Gap(10),
                Text(
                  "Cecelia Cremin",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff0E0E0E),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.phone_outlined, size: 24),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.videocam_outlined, size: 24),
                ),
              ],
            ),
          ),

          // Chat Messages
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // Received message 1
                _buildReceivedMessage(
                  message: "Hello, Lionel, How are you?",
                  time: "10:00 AM",
                ),
                Gap(12),

                // Sent message 1
                _buildSentMessage(
                  message: "Hello, Lionel, How are you?",
                  time: "10:00 AM",
                ),
                Gap(12),

                // Received message 2
                _buildReceivedMessage(
                  message: "Hello, Lionel, How are you?",
                  time: "10:00 AM",
                ),
                Gap(12),

                // Received voice message
                _buildReceivedVoiceMessage(
                  duration: "0:05",
                  time: "10:00 AM",
                ),
                Gap(12),

                // Sent voice message
                _buildSentVoiceMessage(
                  duration: "0:05",
                  time: "10:00 AM",
                ),

              ],
            ),
          ),

          // Message Input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(6.21),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            decoration: InputDecoration(
                              hintText: "Type here...",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff424242),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/attach_file.png', // Replace with your image path
                            width: 20,
                            height: 20,
                            color: Color(0xff7E7E7E), // Optional: applies color tint
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/camera.png',
                            width: 25,// Replace with your image path
                            color: Color(0xff7E7E7E), // Optional: applies color tint
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(8),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff80D050),
                    borderRadius: BorderRadius.circular(6.21),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Received text message
  Widget _buildReceivedMessage({required String message, required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/id_pic2.png'),
        ),
        Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 250),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(3.15),
              ),
              child: Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff0E0E0E),
                ),
              ),
            ),
            Gap(4),
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7E7E7E),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Sent text message
  Widget _buildSentMessage({required String message, required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 250),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xff8BC34A),
                borderRadius: BorderRadius.circular(3.15),

              ),
              child: Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Gap(4),
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7E7E7E),
                ),
              ),
            ),
          ],
        ),
        Gap(8),
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/id_pic2.png'),
        ),
      ],
    );
  }

  // Received voice message
  Widget _buildReceivedVoiceMessage({required String duration, required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/id_pic2.png'),
        ),
        Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VoiceMessageBubble(
              backgroundColor: Color(0xffF5F5F5),
              iconColor: Color(0xff0E0E0E),
              waveColor: Color(0xff0E0E0E),
              audioPath: 'assets/audio/sample.mp3',
              isSender: false,
            ),
            Gap(4),
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7E7E7E),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Sent voice message
  Widget _buildSentVoiceMessage({required String duration, required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            VoiceMessageBubble(
              backgroundColor: Color(0xff8BC34A),
              iconColor: Colors.white,
              waveColor: Colors.white,
              audioPath: 'assets/audio/sample.mp3',
              isSender: true,
            ),
            Gap(4),
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7E7E7E),
                ),
              ),
            ),
          ],
        ),
        Gap(8),
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/id_pic2.png'),
        ),
      ],
    );
  }
}

// Voice Message Widget
class VoiceMessageBubble extends StatefulWidget {
  final Color backgroundColor;
  final Color iconColor;
  final Color waveColor;
  final String audioPath;
  final bool isSender;

  const VoiceMessageBubble({
    Key? key,
    required this.backgroundColor,
    required this.iconColor,
    required this.waveColor,
    required this.audioPath,
    required this.isSender,
  }) : super(key: key);

  @override
  State<VoiceMessageBubble> createState() => _VoiceMessageBubbleState();
}

class _VoiceMessageBubbleState extends State<VoiceMessageBubble> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _audioPlayer.setAsset(widget.audioPath);
      _audioPlayer.durationStream.listen((d) {
        if (d != null) setState(() => duration = d);
      });
      _audioPlayer.positionStream.listen((p) {
        setState(() => position = p);
      });
      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          setState(() {
            isPlaying = false;
            position = Duration.zero;
          });
          _audioPlayer.seek(Duration.zero);
        }
      });
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    setState(() => isPlaying = !isPlaying);
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.isSender
            ? BorderRadius.circular(3.15)

          :BorderRadius.circular(3.15),

    ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _togglePlayPause,
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: widget.iconColor,
              size: 28,
            ),
          ),
          Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return CustomPaint(
                        size: Size(constraints.maxWidth, 24),
                        painter: WaveformPainter(
                          color: widget.waveColor,
                          progress: duration.inMilliseconds > 0
                              ? position.inMilliseconds / duration.inMilliseconds
                              : 0.0,
                        ),
                      );
                    },
                  ),
                ),
                Gap(4),
                Text(
                  duration.inSeconds > 0
                      ? _formatDuration(position)
                      : '00:00',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: widget.iconColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Waveform Painter
class WaveformPainter extends CustomPainter {
  final Color color;
  final double progress;

  WaveformPainter({required this.color, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final activePaint = Paint()
      ..color = color.withOpacity(0.5)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final heights = [6.0, 12.0, 8.0, 16.0, 10.0, 18.0, 14.0, 8.0, 14.0, 10.0, 6.0, 12.0, 8.0, 14.0];
    final spacing = size.width / heights.length;

    for (int i = 0; i < heights.length; i++) {
      final x = i * spacing + spacing / 2;
      final height = heights[i];
      final y1 = (size.height - height) / 2;
      final y2 = y1 + height;

      final currentPaint = (i / heights.length) <= progress ? paint : activePaint;
      canvas.drawLine(Offset(x, y1), Offset(x, y2), currentPaint);
    }
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) =>
      oldDelegate.progress != progress;
}