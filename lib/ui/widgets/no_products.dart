// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoProduct extends StatefulWidget {
  const NoProduct({super.key});

  @override
  State<NoProduct> createState() => _NoProductState();
}

class _NoProductState extends State<NoProduct> {
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
              'assets/images/no-products.svg',
              width: 150,
              height: 150,
            ),
          ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Center(
                child: Text(
              "No products",
              style: GoogleFonts.ibmPlexSans(
                  fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.009),
            Center(
                child: Text(
              "You dont have any product yet ",
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
