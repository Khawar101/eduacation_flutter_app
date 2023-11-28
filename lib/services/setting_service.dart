import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:education/app/app.router.dart';
import '../app/app.locator.dart';
import 'dart:developer';


class SettingService {
  final _navigationService = locator<NavigationService>();

  signOut() async {
    try{
    await FirebaseAuth.instance.signOut();
    _navigationService.navigateToLoginView();
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,reason:"function:signOut",printDetails: true,fatal: true);
      log(e.toString());
    }
  }
}
