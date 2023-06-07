// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:education/ui/views/acount/acount_view.dart' as _i26;
import 'package:education/ui/views/auth/forget/forget_view.dart' as _i6;
import 'package:education/ui/views/auth/forget/login/login_view.dart' as _i4;
import 'package:education/ui/views/auth/signup/signup_view.dart' as _i5;
import 'package:education/ui/views/auth/verify/verify_view.dart' as _i7;
import 'package:education/ui/views/buttom_bar/buttom_bar.dart' as _i8;
import 'package:education/ui/views/buttom_bar/chat/chats/chats_view.dart'
    as _i10;
import 'package:education/ui/views/buttom_bar/chat/inbox/inbox_view.dart'
    as _i11;
import 'package:education/ui/views/buttom_bar/dashboard/dashboard.dart' as _i9;
import 'package:education/ui/views/buttom_bar/lessons_screen/learners/learners_view.dart'
    as _i17;
import 'package:education/ui/views/buttom_bar/lessons_screen/lessons/lessons_view.dart'
    as _i34;
import 'package:education/ui/views/buttom_bar/lessons_screen/lessons_screen_view.dart'
    as _i14;
import 'package:education/ui/views/buttom_bar/lessons_screen/marketing/marketing_view.dart'
    as _i15;
import 'package:education/ui/views/buttom_bar/profile/edit_info/edit_info_view.dart'
    as _i13;
import 'package:education/ui/views/buttom_bar/profile/profile_view.dart'
    as _i12;
import 'package:education/ui/views/buttom_bar/student_information/student_information_view.dart'
    as _i18;
import 'package:education/ui/views/contact/contact_view.dart' as _i21;
import 'package:education/ui/views/coursespage/coursedetail/coursedetail_view.dart'
    as _i35;
import 'package:education/ui/views/coursespage/coursedetail/widgets/tapBar/widgets/comment/addcomment/addcomment_view.dart'
    as _i38;
import 'package:education/ui/views/coursespage/coursedetail/widgets/tapBar/widgets/project/addproject/addproject_view.dart'
    as _i36;
import 'package:education/ui/views/coursespage/coursedetail/widgets/tapBar/widgets/project/addproject/poster/poster_view.dart'
    as _i37;
import 'package:education/ui/views/coursespage/courses_view.dart' as _i16;
import 'package:education/ui/views/coursespage/favouritesub/favouritesub_view.dart'
    as _i33;
import 'package:education/ui/views/drawer/drawer_view.dart' as _i25;
import 'package:education/ui/views/e_book/e_book_view.dart' as _i41;
import 'package:education/ui/views/e_learning/categories/categories_view.dart'
    as _i40;
import 'package:education/ui/views/e_learning/e_learning_view.dart' as _i39;
import 'package:education/ui/views/notification/notification_view.dart' as _i19;
import 'package:education/ui/views/payment_method/card/card_view.dart' as _i30;
import 'package:education/ui/views/payment_method/cardbottomsheet/cardbottomsheet_view.dart'
    as _i31;
import 'package:education/ui/views/payment_method/carddata/carddata_view.dart'
    as _i29;
import 'package:education/ui/views/payment_method/enhance/enhance_view.dart'
    as _i28;
import 'package:education/ui/views/payment_method/paymentdone/paymentdone_view.dart'
    as _i32;
import 'package:education/ui/views/setting/setting_view.dart' as _i20;
import 'package:education/ui/views/splash_screen/splash_screen_view.dart'
    as _i3;
import 'package:education/ui/views/startup/startup_view.dart' as _i2;
import 'package:education/ui/views/teacher/booking/booking_view.dart' as _i24;
import 'package:education/ui/views/teacher/detail/detail_view.dart' as _i23;
import 'package:education/ui/views/teacher/popular_view.dart' as _i22;
import 'package:education/ui/views/teacher/sdatetime/sdatetime_view.dart'
    as _i27;
import 'package:flutter/material.dart' as _i42;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i43;

class Routes {
  static const startupView = '/startup-view';

  static const splashScreenView = '/splash-screen-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const forgetView = '/forget-view';

  static const verifyView = '/verify-view';

  static const buttomBarView = '/buttom-bar-view';

  static const dashboardView = '/dashboard-view';

  static const chatsView = '/chats-view';

  static const inboxView = '/inbox-view';

  static const profileView = '/profile-view';

  static const editInfoView = '/edit-info-view';

  static const lessonsScreenView = '/lessons-screen-view';

  static const marketingView = '/marketing-view';

  static const coursesView = '/courses-view';

  static const learnersView = '/learners-view';

  static const studentInformationView = '/student-information-view';

  static const notificationView = '/notification-view';

  static const settingView = '/setting-view';

  static const contactView = '/contact-view';

  static const popularView = '/popular-view';

  static const detailView = '/detail-view';

  static const bookingView = '/booking-view';

  static const drawerView = '/drawer-view';

  static const acountView = '/acount-view';

  static const sdatetimeView = '/sdatetime-view';

  static const enhanceView = '/enhance-view';

  static const carddataView = '/carddata-view';

  static const cardView = '/card-view';

  static const cardbottomsheetView = '/cardbottomsheet-view';

  static const paymentdoneView = '/paymentdone-view';

  static const favouritesubView = '/favouritesub-view';

  static const lessonsView = '/lessons-view';

  static const coursedetailView = '/coursedetail-view';

  static const addprojectView = '/addproject-view';

  static const posterView = '/poster-view';

  static const addcommentView = '/addcomment-view';

  static const eLearningView = '/e-learning-view';

  static const categoriesView = '/categories-view';

  static const eBookView = '/e-book-view';

  static const all = <String>{
    startupView,
    splashScreenView,
    loginView,
    signupView,
    forgetView,
    verifyView,
    buttomBarView,
    dashboardView,
    chatsView,
    inboxView,
    profileView,
    editInfoView,
    lessonsScreenView,
    marketingView,
    coursesView,
    learnersView,
    studentInformationView,
    notificationView,
    settingView,
    contactView,
    popularView,
    detailView,
    bookingView,
    drawerView,
    acountView,
    sdatetimeView,
    enhanceView,
    carddataView,
    cardView,
    cardbottomsheetView,
    paymentdoneView,
    favouritesubView,
    lessonsView,
    coursedetailView,
    addprojectView,
    posterView,
    addcommentView,
    eLearningView,
    categoriesView,
    eBookView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i3.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i5.SignupView,
    ),
    _i1.RouteDef(
      Routes.forgetView,
      page: _i6.ForgetView,
    ),
    _i1.RouteDef(
      Routes.verifyView,
      page: _i7.VerifyView,
    ),
    _i1.RouteDef(
      Routes.buttomBarView,
      page: _i8.ButtomBarView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i9.DashboardView,
    ),
    _i1.RouteDef(
      Routes.chatsView,
      page: _i10.ChatsView,
    ),
    _i1.RouteDef(
      Routes.inboxView,
      page: _i11.InboxView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i12.ProfileView,
    ),
    _i1.RouteDef(
      Routes.editInfoView,
      page: _i13.EditInfoView,
    ),
    _i1.RouteDef(
      Routes.lessonsScreenView,
      page: _i14.LessonsScreenView,
    ),
    _i1.RouteDef(
      Routes.marketingView,
      page: _i15.MarketingView,
    ),
    _i1.RouteDef(
      Routes.coursesView,
      page: _i16.CoursesView,
    ),
    _i1.RouteDef(
      Routes.learnersView,
      page: _i17.LearnersView,
    ),
    _i1.RouteDef(
      Routes.studentInformationView,
      page: _i18.StudentInformationView,
    ),
    _i1.RouteDef(
      Routes.notificationView,
      page: _i19.NotificationView,
    ),
    _i1.RouteDef(
      Routes.settingView,
      page: _i20.SettingView,
    ),
    _i1.RouteDef(
      Routes.contactView,
      page: _i21.ContactView,
    ),
    _i1.RouteDef(
      Routes.popularView,
      page: _i22.PopularView,
    ),
    _i1.RouteDef(
      Routes.detailView,
      page: _i23.DetailView,
    ),
    _i1.RouteDef(
      Routes.bookingView,
      page: _i24.BookingView,
    ),
    _i1.RouteDef(
      Routes.drawerView,
      page: _i25.DrawerView,
    ),
    _i1.RouteDef(
      Routes.acountView,
      page: _i26.AcountView,
    ),
    _i1.RouteDef(
      Routes.sdatetimeView,
      page: _i27.SdatetimeView,
    ),
    _i1.RouteDef(
      Routes.enhanceView,
      page: _i28.EnhanceView,
    ),
    _i1.RouteDef(
      Routes.carddataView,
      page: _i29.CarddataView,
    ),
    _i1.RouteDef(
      Routes.cardView,
      page: _i30.CardView,
    ),
    _i1.RouteDef(
      Routes.cardbottomsheetView,
      page: _i31.CardbottomsheetView,
    ),
    _i1.RouteDef(
      Routes.paymentdoneView,
      page: _i32.PaymentdoneView,
    ),
    _i1.RouteDef(
      Routes.favouritesubView,
      page: _i33.FavouritesubView,
    ),
    _i1.RouteDef(
      Routes.lessonsView,
      page: _i34.LessonsView,
    ),
    _i1.RouteDef(
      Routes.coursedetailView,
      page: _i35.CoursedetailView,
    ),
    _i1.RouteDef(
      Routes.addprojectView,
      page: _i36.AddprojectView,
    ),
    _i1.RouteDef(
      Routes.posterView,
      page: _i37.PosterView,
    ),
    _i1.RouteDef(
      Routes.addcommentView,
      page: _i38.AddcommentView,
    ),
    _i1.RouteDef(
      Routes.eLearningView,
      page: _i39.ELearningView,
    ),
    _i1.RouteDef(
      Routes.categoriesView,
      page: _i40.CategoriesView,
    ),
    _i1.RouteDef(
      Routes.eBookView,
      page: _i41.EBookView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.SplashScreenView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SplashScreenView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.SignupView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignupView(),
        settings: data,
      );
    },
    _i6.ForgetView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgetView(),
        settings: data,
      );
    },
    _i7.VerifyView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.VerifyView(),
        settings: data,
      );
    },
    _i8.ButtomBarView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ButtomBarView(),
        settings: data,
      );
    },
    _i9.DashboardView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.DashboardView(),
        settings: data,
      );
    },
    _i10.ChatsView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ChatsView(),
        settings: data,
      );
    },
    _i11.InboxView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.InboxView(),
        settings: data,
      );
    },
    _i12.ProfileView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ProfileView(),
        settings: data,
      );
    },
    _i13.EditInfoView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.EditInfoView(),
        settings: data,
      );
    },
    _i14.LessonsScreenView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.LessonsScreenView(),
        settings: data,
      );
    },
    _i15.MarketingView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.MarketingView(),
        settings: data,
      );
    },
    _i16.CoursesView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.CoursesView(),
        settings: data,
      );
    },
    _i17.LearnersView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.LearnersView(),
        settings: data,
      );
    },
    _i18.StudentInformationView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.StudentInformationView(),
        settings: data,
      );
    },
    _i19.NotificationView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.NotificationView(),
        settings: data,
      );
    },
    _i20.SettingView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.SettingView(),
        settings: data,
      );
    },
    _i21.ContactView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.ContactView(),
        settings: data,
      );
    },
    _i22.PopularView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.PopularView(),
        settings: data,
      );
    },
    _i23.DetailView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.DetailView(),
        settings: data,
      );
    },
    _i24.BookingView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.BookingView(),
        settings: data,
      );
    },
    _i25.DrawerView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.DrawerView(),
        settings: data,
      );
    },
    _i26.AcountView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.AcountView(),
        settings: data,
      );
    },
    _i27.SdatetimeView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.SdatetimeView(),
        settings: data,
      );
    },
    _i28.EnhanceView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.EnhanceView(),
        settings: data,
      );
    },
    _i29.CarddataView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i29.CarddataView(),
        settings: data,
      );
    },
    _i30.CardView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i30.CardView(),
        settings: data,
      );
    },
    _i31.CardbottomsheetView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i31.CardbottomsheetView(),
        settings: data,
      );
    },
    _i32.PaymentdoneView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.PaymentdoneView(),
        settings: data,
      );
    },
    _i33.FavouritesubView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i33.FavouritesubView(),
        settings: data,
      );
    },
    _i34.LessonsView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i34.LessonsView(),
        settings: data,
      );
    },
    _i35.CoursedetailView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i35.CoursedetailView(),
        settings: data,
      );
    },
    _i36.AddprojectView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i36.AddprojectView(),
        settings: data,
      );
    },
    _i37.PosterView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i37.PosterView(),
        settings: data,
      );
    },
    _i38.AddcommentView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i38.AddcommentView(),
        settings: data,
      );
    },
    _i39.ELearningView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i39.ELearningView(),
        settings: data,
      );
    },
    _i40.CategoriesView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i40.CategoriesView(),
        settings: data,
      );
    },
    _i41.EBookView: (data) {
      return _i42.MaterialPageRoute<dynamic>(
        builder: (context) => const _i41.EBookView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i43.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToButtomBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buttomBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInboxView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.inboxView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLessonsScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.lessonsScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMarketingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.marketingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.coursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLearnersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.learnersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentInformationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentInformationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPopularView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.popularView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.detailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBookingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bookingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDrawerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.drawerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAcountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.acountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSdatetimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sdatetimeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnhanceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.enhanceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCarddataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.carddataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCardbottomsheetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cardbottomsheetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPaymentdoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.paymentdoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavouritesubView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.favouritesubView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLessonsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.lessonsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCoursedetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.coursedetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddprojectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addprojectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPosterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.posterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddcommentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addcommentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToELearningView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.eLearningView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoriesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.categoriesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEBookView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.eBookView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithButtomBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buttomBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInboxView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.inboxView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLessonsScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.lessonsScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMarketingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.marketingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.coursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLearnersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.learnersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentInformationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentInformationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPopularView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.popularView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.detailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBookingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bookingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDrawerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.drawerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAcountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.acountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSdatetimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sdatetimeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEnhanceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.enhanceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCarddataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.carddataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCardbottomsheetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cardbottomsheetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPaymentdoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.paymentdoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavouritesubView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.favouritesubView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLessonsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.lessonsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCoursedetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.coursedetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddprojectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addprojectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPosterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.posterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddcommentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addcommentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithELearningView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.eLearningView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoriesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.categoriesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEBookView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.eBookView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
