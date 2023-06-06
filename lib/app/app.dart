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
import 'package:education/ui/views/home/buttom_bar/buttom_bar.dart';
import 'package:education/ui/views/home/dashboard/dashboard.dart';
import 'package:education/ui/views/home/chat/chats/chats_view.dart';
import 'package:education/ui/views/home/chat/inbox/inbox_view.dart';
import 'package:education/ui/views/home/profile/profile_view.dart';
import 'package:education/ui/views/home/profile/edit_info/edit_info_view.dart';
import 'package:education/ui/views/home/lessons_screen/lessons_screen_view.dart';
import 'package:education/ui/views/home/lessons_screen/marketing/marketing_view.dart';
import 'package:education/ui/views/home/lessons_screen/course/course_view.dart';
import 'package:education/ui/views/home/lessons_screen/learners/learners_view.dart';
import 'package:education/ui/views/home/student_information/student_information_view.dart';
import 'package:education/ui/views/notification/notification_view.dart';
import 'package:education/ui/views/setting/setting_view.dart';
import 'package:education/ui/views/contact/contact_view.dart';
import 'package:education/ui/views/teacher/detail/detail_view.dart';
import 'package:education/ui/views/teacher/booking/booking_view.dart';

import '../ui/views/teacher/popular_view.dart';
import 'package:education/ui/views/drawer/drawer_view.dart';
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
    MaterialRoute(page: ChatsView),
    MaterialRoute(page: InboxView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: EditInfoView),
    MaterialRoute(page: LessonsScreenView),
    MaterialRoute(page: MarketingView),
    MaterialRoute(page: CourseView),
    MaterialRoute(page: LearnersView),
    MaterialRoute(page: StudentInformationView),
    MaterialRoute(page: NotificationView),
    MaterialRoute(page: SettingView),
    MaterialRoute(page: ContactView),
    MaterialRoute(page: PopularView),
    MaterialRoute(page: DetailView),
    MaterialRoute(page: BookingView),
    MaterialRoute(page: DrawerView),
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
