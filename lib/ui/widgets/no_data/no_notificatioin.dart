// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoNotification extends StatefulWidget {
  const NoNotification({super.key});

  @override
  State<NoNotification> createState() => _NoNotificationState();
}

class _NoNotificationState extends State<NoNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5f1f8),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.08,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_back_ios_new),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Center(
                child: SvgPicture.asset(
              'assets/images/notification_icon.svg',
              width: 150,
              height: 150,
            ),
          ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Center(
              child: Text(
                "No Notification yet!",
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.009),
            Center(
              child: Text(
                "We'll notify you once we have\nsomething for you ",
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
