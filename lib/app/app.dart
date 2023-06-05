import 'package:education/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:education/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:education/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/ui/views/splash_screen/splash_screen_view.dart';
import 'package:education/ui/views/auth/forget/login/login_view.dart';
import 'package:education/ui/views/auth/signup/signup_view.dart';
import 'package:education/ui/views/auth/forget/forget_view.dart';
import 'package:education/ui/views/auth/verify/verify_view.dart';
import 'package:education/ui/views/home/buttom_bar/buttom_bar_view.dart';
import 'package:education/ui/views/dashboard/dashboard_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SplashScreenView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: ForgetView),
    MaterialRoute(page: VerifyView),
    MaterialRoute(page: ButtomBarView),
    MaterialRoute(page: DashboardView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
