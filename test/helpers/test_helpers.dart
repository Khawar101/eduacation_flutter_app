import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:education/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/services/signup_service.dart';
import 'package:education/services/login_service.dart';
import 'package:education/services/profile_service.dart';
import 'package:education/services/chats_service.dart';
import 'package:education/services/forgetpassword_service.dart';
import 'package:education/services/setting_service.dart';
import 'package:education/services/rating_service.dart';
import 'package:education/services/subscription_service.dart';
import 'package:education/services/favorite_courses_service.dart';
import 'package:education/services/ebook_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SignupService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ProfileService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ChatsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ForgetpasswordService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SettingService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RatingService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SubscriptionService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FavoriteCoursesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<EbookService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterSignupService();
  getAndRegisterLoginService();
  getAndRegisterProfileService();
  getAndRegisterChatsService();
  getAndRegisterForgetpasswordService();
  getAndRegisterSettingService();
  getAndRegisterRatingService();
  getAndRegisterSubscriptionService();
  getAndRegisterFavoriteCoursesService();
  getAndRegisterEbookService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockSignupService getAndRegisterSignupService() {
  _removeRegistrationIfExists<SignupService>();
  final service = MockSignupService();
  locator.registerSingleton<SignupService>(service);
  return service;
}

MockLoginService getAndRegisterLoginService() {
  _removeRegistrationIfExists<LoginService>();
  final service = MockLoginService();
  locator.registerSingleton<LoginService>(service);
  return service;
}

MockProfileService getAndRegisterProfileService() {
  _removeRegistrationIfExists<ProfileService>();
  final service = MockProfileService();
  locator.registerSingleton<ProfileService>(service);
  return service;
}

MockChatsService getAndRegisterChatsService() {
  _removeRegistrationIfExists<ChatsService>();
  final service = MockChatsService();
  locator.registerSingleton<ChatsService>(service);
  return service;
}

MockForgetpasswordService getAndRegisterForgetpasswordService() {
  _removeRegistrationIfExists<ForgetpasswordService>();
  final service = MockForgetpasswordService();
  locator.registerSingleton<ForgetpasswordService>(service);
  return service;
}

MockSettingService getAndRegisterSettingService() {
  _removeRegistrationIfExists<SettingService>();
  final service = MockSettingService();
  locator.registerSingleton<SettingService>(service);
  return service;
}

MockRatingService getAndRegisterRatingService() {
  _removeRegistrationIfExists<RatingService>();
  final service = MockRatingService();
  locator.registerSingleton<RatingService>(service);
  return service;
}

MockSubscriptionService getAndRegisterSubscriptionService() {
  _removeRegistrationIfExists<SubscriptionService>();
  final service = MockSubscriptionService();
  locator.registerSingleton<SubscriptionService>(service);
  return service;
}

MockFavoriteCoursesService getAndRegisterFavoriteCoursesService() {
  _removeRegistrationIfExists<FavoriteCoursesService>();
  final service = MockFavoriteCoursesService();
  locator.registerSingleton<FavoriteCoursesService>(service);
  return service;
}

MockEbookService getAndRegisterEbookService() {
  _removeRegistrationIfExists<EbookService>();
  final service = MockEbookService();
  locator.registerSingleton<EbookService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
