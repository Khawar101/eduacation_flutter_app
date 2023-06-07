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
import 'package:education/ui/views/buttom_bar/buttom_bar.dart';
import 'package:education/ui/views/buttom_bar/dashboard/dashboard.dart';
import 'package:education/ui/views/buttom_bar/chat/chats/chats_view.dart';
import 'package:education/ui/views/buttom_bar/chat/inbox/inbox_view.dart';
import 'package:education/ui/views/buttom_bar/profile/profile_view.dart';
import 'package:education/ui/views/buttom_bar/profile/edit_info/edit_info_view.dart';
import 'package:education/ui/views/buttom_bar/lessons_screen/lessons_screen_view.dart';
import 'package:education/ui/views/buttom_bar/lessons_screen/marketing/marketing_view.dart';
import 'package:education/ui/views/buttom_bar/lessons_screen/learners/learners_view.dart';
import 'package:education/ui/views/buttom_bar/student_information/student_information_view.dart';
import 'package:education/ui/views/notification/notification_view.dart';
import 'package:education/ui/views/setting/setting_view.dart';
import 'package:education/ui/views/contact/contact_view.dart';
import 'package:education/ui/views/teacher/detail/detail_view.dart';
import 'package:education/ui/views/teacher/booking/booking_view.dart';

import '../ui/views/coursespage/coursedetail/coursedetail_view.dart';
import '../ui/views/coursespage/courses_view.dart';
import '../ui/views/teacher/popular_view.dart';
import 'package:education/ui/views/drawer/drawer_view.dart';
import 'package:education/ui/views/acount/acount_view.dart';
import 'package:education/ui/views/teacher/sdatetime/sdatetime_view.dart';
import 'package:education/ui/views/payment_method/enhance/enhance_view.dart';
import 'package:education/ui/views/payment_method/carddata/carddata_view.dart';
import 'package:education/ui/views/payment_method/card/card_view.dart';
import 'package:education/ui/views/payment_method/cardbottomsheet/cardbottomsheet_view.dart';
import 'package:education/ui/views/payment_method/paymentdone/paymentdone_view.dart';
import 'package:education/ui/views/coursespage/favouritesub/favouritesub_view.dart';
import 'package:education/ui/views/buttom_bar/lessons_screen/lessons/lessons_view.dart';
import 'package:education/ui/views/e_learning/e_learning_view.dart';
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
    MaterialRoute(page: CoursesView),
    MaterialRoute(page: LearnersView),
    MaterialRoute(page: StudentInformationView),
    MaterialRoute(page: NotificationView),
    MaterialRoute(page: SettingView),
    MaterialRoute(page: ContactView),
    MaterialRoute(page: PopularView),
    MaterialRoute(page: DetailView),
    MaterialRoute(page: BookingView),
    MaterialRoute(page: DrawerView),
    MaterialRoute(page: AcountView),
    MaterialRoute(page: SdatetimeView),
    MaterialRoute(page: EnhanceView),
    MaterialRoute(page: CarddataView),
    MaterialRoute(page: CardView),
    MaterialRoute(page: CardbottomsheetView),
    MaterialRoute(page: PaymentdoneView),
    MaterialRoute(page: FavouritesubView),

    MaterialRoute(page: LessonsView),
    MaterialRoute(page: CoursedetailView),
    MaterialRoute(page: ELearningView),
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
