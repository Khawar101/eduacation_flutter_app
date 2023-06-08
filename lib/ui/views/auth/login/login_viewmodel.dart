// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names

import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:education/services/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class LoginViewModel extends BaseViewModel {
  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();

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
//  String email = emailCTRL.text.trim();
//     // String number = numberCTRL.text.trim();
//     String password = passwordCTRL.text.trim();

  TextEditingController emailCTRL =
      TextEditingController(text: "xyz@gmail.com");

  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");

  bool looding = false;
  bool _obscureText = true;

  logIN() async {
    await _loginService.logins(emailCTRL, passwordCTRL);
    if (_loginService.message == 'login successfully') {
      // log("sign up now...");
      _navigationService.navigateToButtomBarView();
    } else {
      log("try again...");
    }
    log("=====>${_loginService.message}");
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
