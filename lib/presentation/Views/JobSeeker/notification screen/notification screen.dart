import 'package:crm_app/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Dummy notifications data
  final List<Map<String, dynamic>> notifications = [
    {
      'id': 1,
      'heading': 'Application Accepted',
      'description': 'Your application for Senior Flutter Developer at Google has been accepted. The interview is scheduled for next week.',
      'time': '2 hours ago',
      'isRead': false,
      'icon': Icons.check_circle,
      'iconColor': Color(0xff80D050),
    },
    {
      'id': 2,
      'heading': 'New Job Posted',
      'description': 'A new job matching your profile has been posted: UI/UX Designer at Meta. Apply now!',
      'time': '5 hours ago',
      'isRead': false,
      'icon': Icons.work,
      'iconColor': Color(0xff4A90E2),
    },
    {
      'id': 3,
      'heading': 'Application Status Update',
      'description': 'Your application for Product Manager at Amazon is under review. We will notify you once there is an update.',
      'time': '1 day ago',
      'isRead': true,
      'icon': Icons.update,
      'iconColor': Color(0xffFFA500),
    },
    {
      'id': 4,
      'heading': 'Interview Reminder',
      'description': 'You have an interview scheduled tomorrow at 10:00 AM for the Backend Developer position at Netflix.',
      'time': '1 day ago',
      'isRead': true,
      'icon': Icons.alarm,
      'iconColor': Color(0xffFF6B6B),
    },
    {
      'id': 5,
      'heading': 'Profile Viewed',
      'description': 'Your profile was viewed by 12 recruiters in the last 7 days. Keep your profile updated to get more opportunities.',
      'time': '2 days ago',
      'isRead': true,
      'icon': Icons.visibility,
      'iconColor': Color(0xff9B59B6),
    },
    {
      'id': 6,
      'heading': 'Application Rejected',
      'description': 'Unfortunately, your application for Data Scientist at Microsoft was not selected. Keep applying!',
      'time': '3 days ago',
      'isRead': true,
      'icon': Icons.cancel,
      'iconColor': Color(0xffE74C3C),
    },
    {
      'id': 7,
      'heading': 'Saved Job Deadline',
      'description': 'The application deadline for Frontend Developer at Apple is approaching. Only 2 days left to apply.',
      'time': '4 days ago',
      'isRead': true,
      'icon': Icons.timer,
      'iconColor': Color(0xffF39C12),
    },
    {
      'id': 8,
      'heading': 'Welcome to Job Portal',
      'description': 'Thank you for joining our platform! Complete your profile to get personalized job recommendations.',
      'time': '1 week ago',
      'isRead': true,
      'icon': Icons.waving_hand,
      'iconColor': Color(0xff3498DB),
    },
  ];

  void _markAsRead(int index) {
    setState(() {
      notifications[index]['isRead'] = true;
    });
  }

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification deleted'),
        backgroundColor: Color(0xff80D050),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification['isRead'] = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications marked as read'),
        backgroundColor: Color(0xff80D050),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int unreadCount = notifications.where((n) => n['isRead'] == false).length;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Notifications',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: FrontendConfigs.kBlackColor,
            ),
          ),
          centerTitle: true,
          actions: [
            if (unreadCount > 0)
              TextButton(
                onPressed: _markAllAsRead,
                child: Text(
                  'Mark all read',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff80D050),
                  ),
                ),
              ),
          ],
        ),
      ),
      body: notifications.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 80,
              color: const Color(0xff9A9A9A),
            ),
            const Gap(20),
            Text(
              'No Notifications',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: FrontendConfigs.kBlackColor,
              ),
            ),
            const Gap(8),
            Text(
              'You\'re all caught up!',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff9A9A9A),
              ),
            ),
          ],
        ),
      )
          : Column(
        children: [
          // Unread count banner
          if (unreadCount > 0)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xffCECECE),
                    width: 0.6,
                  ),
                ),
              ),
              child: Text(
                '$unreadCount unread notification${unreadCount > 1 ? 's' : ''}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff515151),
                ),
              ),
            ),

          // Notifications List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final isRead = notification['isRead'] as bool;

                return Column(
                  children: [
                    Dismissible(
                      key: Key(notification['id'].toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        color: const Color(0xffE74C3C),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      onDismissed: (direction) {
                        _deleteNotification(index);
                      },
                      child: InkWell(
                        onTap: () {
                          if (!isRead) {
                            _markAsRead(index);
                          }
                        },
                        child: Container(
                          color: isRead ? Colors.white : const Color(0xffF9FFF4),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon Container
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: (notification['iconColor'] as Color).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  notification['icon'] as IconData,
                                  color: notification['iconColor'] as Color,
                                  size: 24,
                                ),
                              ),
                              const Gap(12),

                              // Content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            notification['heading'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: FrontendConfigs.kBlackColor,
                                            ),
                                          ),
                                        ),
                                        if (!isRead)
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color(0xff80D050),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const Gap(6),
                                    Text(
                                      notification['description'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff515151),
                                        height: 1.4,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Gap(8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 14,
                                          color: const Color(0xff9A9A9A),
                                        ),
                                        const Gap(4),
                                        Text(
                                          notification['time'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff9A9A9A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 0.6,
                      color: Color(0xffCECECE),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}