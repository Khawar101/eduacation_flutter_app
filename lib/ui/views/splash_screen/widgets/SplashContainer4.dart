// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'SplashContainer5.dart';

class SplashContainer4 extends StatefulWidget {
  const SplashContainer4({super.key});

  @override
  _SplashContainer4State createState() => _SplashContainer4State();
}

class _SplashContainer4State extends State<SplashContainer4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5f1f8),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'assets/images/girl-images-3.webp',
                  fit: BoxFit.cover,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.scale(
                scale: 1.65,
                origin: const Offset(-5, 30),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(300),
                          topRight: Radius.circular(290)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06),
                        Text(
                          'Ready to find\na Course',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSans(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          'A handful of model sentence structures\nto generate lorem which looks reason \nable.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSans(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.044),
                        CircularStepProgressIndicator(
                          totalSteps: 4,
                          currentStep: 3,
                          stepSize: 2,
                          selectedColor:
                              const Color(0xff4873a6).withOpacity(0.7),
                          unselectedColor: Colors.grey[200],
                          padding: 0,
                          width: 40,
                          height: 40,
                          selectedStepSize: 2,
                          roundedCap: (_, __) => true,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const SplashContainer5())));
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                  top: MediaQuery.of(context).size.height * 0.4),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color(0xff4873a6).withOpacity(0.7),
                ),
                child: const Center(
                    child: Icon(
                  Icons.phone_android_sharp,
                  color: Colors.white,
                  size: 18,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.8,
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.grey),
                child: Center(
                    child: Image.asset(
                  'assets/icons/react-native-50.png',
                  width: 40,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.22,
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orangeAccent),
                child: Center(
                    child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)),
                  child: Center(
                      child: Text(
                    'A+',
                    style: GoogleFonts.ibmPlexSans(
                      color: Colors.white,
                    ),
                  )),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.83,
                  top: MediaQuery.of(context).size.height * 0.35),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orangeAccent),
                alignment: FractionalOffset.topRight,
                transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -360),
                child: Center(
                    child: Image.asset(
                  'assets/icons/book-64.png',
                  width: 27,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
