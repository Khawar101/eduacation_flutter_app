import 'package:education/ui/views/auth/login/login_view.dart';
import 'package:education/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/login_service.dart';
import '../../buttom_bar/buttom_bar.dart';
import 'SplashContainer2.dart';

class SplashContainer1 extends StatefulWidget {
  const SplashContainer1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashContainer1State createState() => _SplashContainer1State();
}

class _SplashContainer1State extends State<SplashContainer1> {
  String userId = '';
  bool isFirstRun = true;
  final _loginService = locator<LoginService>();

  checkIfUserLoggedIn() async {
    isFirstRun = await Store.retrieveBool('firstRun');
    if (isFirstRun == false) {
      userId = await Store.retrieve('userId');
      if (userId.isNotEmpty && userId != "") {
        _loginService.updateUserData(userId);
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ButtomBarView()),
          );
        });
      } else {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
          );
        });
      }
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashContainer2()),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5f1f8),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
                child: Text(
              'Education\nApp',
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            )),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber),
                alignment: FractionalOffset.topRight,
                transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -360),
                child: const Center(
                    child: Icon(
                  Icons.book,
                  color: Colors.white,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.8,
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff4873a6).withOpacity(0.7),
                ),
                child: Center(
                    child: Image.asset(
                  'assets/icons/graduation-cap.png',
                  width: 30,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.4),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber),
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
                  left: MediaQuery.of(context).size.width * 0.39,
                  top: MediaQuery.of(context).size.height * 0.58),
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
                  left: MediaQuery.of(context).size.width * 0.8,
                  top: MediaQuery.of(context).size.height * 0.74),
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
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.86),
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
