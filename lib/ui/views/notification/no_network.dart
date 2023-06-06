// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

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
                child: Image.asset(
              'assets/icons/network_icon.png',
              width: 180,
              height: 180,
            ),
          ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Center(
                child: Text(
              "No Network!",
              style: GoogleFonts.ibmPlexSans(
                  fontSize: 22, fontWeight: FontWeight.w500),
            ),
           ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.009),
            Center(
                child: Text(
              "Please check your network\nand try again ",
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                fontSize: 14,
              ),
            ),
          ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Center(
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Try again",
                  style: GoogleFonts.ibmPlexSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
               ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
