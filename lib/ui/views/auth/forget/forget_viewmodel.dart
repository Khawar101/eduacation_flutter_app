// ignore_for_file: non_constant_identifier_names
// ignore: depend_on_referenced_packages
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/app/app.router.dart';
import '../../../../app/app.locator.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'dart:convert';



class ForgetViewModel extends BaseViewModel {
  bool visibleCheck = true;
  bool visibleCheck2 = true;

  final _navigationService = locator<NavigationService>();
  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  visible_check2() {
    visibleCheck2 = !visibleCheck2;
    notifyListeners();
  }

  navigateLogin() {
    _navigationService.navigateToLoginView();
  }

  late String _token;
  String webApiKey = "AIzaSyDFt9rfagvcgwcJu2R7DFizFqBEztxsrWg";
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$webApiKey");
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      log(responseData.toString());
      _token = responseData['idToken'];
      log('************************' + _token.toString());
      try {
        if (urlSegment == "signUp") {
          sharedPreferences.setString("token", _token.toString());
        }
      } catch (e, s) {
        FirebaseCrashlytics.instance.recordError(e, s,
            reason: "function:urlSegment == 'SignUp'",
            printDetails: true,
            fatal: true);
        log(e.toString());
      }
      log("true");
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:_authenticate()", printDetails: true, fatal: true);
      log(e.toString());
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      return _authenticate(email, password, 'signUp');
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:signUp", printDetails: true, fatal: true);
      log(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      return _authenticate(email, password, 'signInWithPassword');
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:login", printDetails: true, fatal: true);
      log(e.toString());
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      log(newPassword);
      _token = sharedPreferences.getString("token")!;
      final url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:update?key=$webApiKey");
      try {
        await http.post(
          url,
          body: json.encode(
            {
              'idToken': _token,
              'password': newPassword,
              'returnSecureToken': true,
            },
          ),
        );
      } catch (e, s) {
        FirebaseCrashlytics.instance.recordError(e, s,
            reason: "function:http.post(url)", printDetails: true, fatal: true);
        log(e.toString());
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:changePassword", printDetails: true, fatal: true);
      log(e.toString());
    }
  }
}
