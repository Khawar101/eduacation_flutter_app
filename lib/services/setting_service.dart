import 'package:education/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class SettingService {
  final _navigationService = locator<NavigationService>();

  signOut() async {
    await FirebaseAuth.instance.signOut();
    _navigationService.navigateToLoginView();
  }
}
