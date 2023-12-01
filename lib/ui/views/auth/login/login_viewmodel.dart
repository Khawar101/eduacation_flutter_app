// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/login_service.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../utils/shared_preferences.dart';
import 'package:education/app/app.router.dart';
import '../../../../app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class LoginViewModel extends BaseViewModel {
  bool visibleCheck = true;
  bool looding = false;
  bool _obscureText = true;
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();
  TextEditingController emailCTRL =
      TextEditingController(text: "khawarjutt101@gmail.com");
  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");

  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  navigateButtomBar() {
    _navigationService.navigateToButtomBarView();
  }

  navigateSignup() {
    _navigationService.navigateToSignupView();
  }

  navigateForget() {
    _navigationService.navigateToForgetView();
  }

  setFirstTimeFalseToSP() async {
    await Store.saveBool('firstRun', false);
  }
//  String email = emailCTRL.text.trim();
// String number = numberCTRL.text.trim();
//     String password = passwordCTRL.text.trim();

  logIN(context) async {
    userData userDetail = await _loginService.logins(emailCTRL, passwordCTRL);
    try {
      if (_loginService.message == 'login successfully') {
        // log("sign up now...");
        if (userDetail.uID != null && userDetail.uID != "") {
          await Store.save('userId', userDetail.uID!);
        }
        _navigationService.navigateToButtomBarView();
      } else {
        log("try again...");
      }
      log("=====>${_loginService.message}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_loginService.message),
        dismissDirection: DismissDirection.endToStart,
      ));
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:logIN(context)", printDetails: true, fatal: true);
      log(e.toString());
    }
  }

  // final LocalAuthentication auth = LocalAuthentication();
  // _SupportState _supportState = _SupportState.unknown;
  // bool? _canCheckBiometrics;
  // List<BiometricType>? _availableBiometrics;
  // String _authorized = 'Not Authorized';
  // bool _isAuthenticating = false;

  // @override
  // void initState() {
  //   super.initState();
  //   auth.isDeviceSupported().then(
  //         (bool isSupported) => setState(() => _supportState = isSupported
  //             ? _SupportState.supported
  //             : _SupportState.unsupported),
  //       );
  // }

  // Future<void> _checkBiometrics() async {
  //   late bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     canCheckBiometrics = false;
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics;
  //   });
  // }

  // Future<void> _getAvailableBiometrics() async {
  //   late List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     availableBiometrics = <BiometricType>[];
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   setState(() {
  //     _availableBiometrics = availableBiometrics;
  //   });
  // }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   setState(
  //       () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  // }

  // Future<void> _authenticateWithBiometrics() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason:
  //           'Scan your fingerprint (or face or whatever) to authenticate',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Authenticating';
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   final String message = authenticated ? 'Authorized' : 'Not Authorized';
  //   setState(() {
  //     _authorized = message;
  //   });
  // }

  // Future<void> _cancelAuthentication() async {
  //   await auth.stopAuthentication();
  //   setState(() => _isAuthenticating = false);
  // }
}
