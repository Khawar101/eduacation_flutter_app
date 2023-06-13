// Mocks generated by Mockito 5.4.1 from annotations
// in education/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i9;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:education/services/chats_service.dart' as _i13;
import 'package:education/services/forgetpassword_service.dart' as _i14;
import 'package:education/services/login_service.dart' as _i5;
import 'package:education/services/Model/userData.jason' as _i4;
import 'package:education/services/profile_service.dart' as _i12;
import 'package:education/services/setting_service.dart' as _i15;
import 'package:education/services/signup_service.dart' as _i10;
import 'package:email_otp/email_otp.dart' as _i3;
import 'package:flutter/material.dart' as _i7;
import 'package:image_picker/image_picker.dart' as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseFirestore_0 extends _i1.SmartFake
    implements _i2.FirebaseFirestore {
  _FakeFirebaseFirestore_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEmailOTP_1 extends _i1.SmartFake implements _i3.EmailOTP {
  _FakeEmailOTP_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeuserData_2 extends _i1.SmartFake implements _i4.userData {
  _FakeuserData_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginService_3 extends _i1.SmartFake implements _i5.LoginService {
  _FakeLoginService_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i6.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i7.GlobalKey<_i7.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i7.GlobalKey<_i7.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i6.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<T?>? navigateWithTransition<T>(
    _i7.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i7.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i6.Transition? transitionClass,
    _i6.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? replaceWithTransition<T>(
    _i7.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i7.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i6.Transition? transitionClass,
    _i6.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i7.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i7.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? navigateToView<T>(
    _i7.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i7.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i6.Transition? transition,
    _i6.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i7.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearStackAndShowView<T>(
    _i7.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearTillFirstAndShowView<T>(
    _i7.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i7.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i6.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i6.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i8.Future<_i6.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i6.SheetResponse<dynamic>?>.value(),
      ) as _i8.Future<_i6.SheetResponse<dynamic>?>);
  @override
  _i8.Future<_i6.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i9.Color? barrierColor = const _i9.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i8.Future<_i6.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i8.Future<_i6.SheetResponse<T>?>.value(),
      ) as _i8.Future<_i6.SheetResponse<T>?>);
  @override
  void completeSheet(_i6.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i6.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i6.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i7.Widget Function(
      _i7.BuildContext,
      _i6.DialogRequest<dynamic>,
      dynamic Function(_i6.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i9.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i9.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i6.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
      ) as _i8.Future<_i6.DialogResponse<dynamic>?>);
  @override
  _i8.Future<_i6.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i9.Color? barrierColor = const _i9.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i8.Future<_i6.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i8.Future<_i6.DialogResponse<T>?>.value(),
      ) as _i8.Future<_i6.DialogResponse<T>?>);
  @override
  _i8.Future<_i6.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i9.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i9.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i6.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
      ) as _i8.Future<_i6.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i6.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SignupService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignupService extends _i1.Mock implements _i10.SignupService {
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set message(String? _message) => super.noSuchMethod(
        Invocation.setter(
          #message,
          _message,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set profile(dynamic _profile) => super.noSuchMethod(
        Invocation.setter(
          #profile,
          _profile,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set userdata(dynamic _userdata) => super.noSuchMethod(
        Invocation.setter(
          #userdata,
          _userdata,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.FirebaseFirestore get firestore => (super.noSuchMethod(
        Invocation.getter(#firestore),
        returnValue: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
        returnValueForMissingStub: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
      ) as _i2.FirebaseFirestore);
  @override
  set firestore(_i2.FirebaseFirestore? _firestore) => super.noSuchMethod(
        Invocation.setter(
          #firestore,
          _firestore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.EmailOTP get myauth => (super.noSuchMethod(
        Invocation.getter(#myauth),
        returnValue: _FakeEmailOTP_1(
          this,
          Invocation.getter(#myauth),
        ),
        returnValueForMissingStub: _FakeEmailOTP_1(
          this,
          Invocation.getter(#myauth),
        ),
      ) as _i3.EmailOTP);
  @override
  set myauth(_i3.EmailOTP? _myauth) => super.noSuchMethod(
        Invocation.setter(
          #myauth,
          _myauth,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set image(_i11.XFile? _image) => super.noSuchMethod(
        Invocation.setter(
          #image,
          _image,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<dynamic> pickImage() => (super.noSuchMethod(
        Invocation.method(
          #pickImage,
          [],
        ),
        returnValue: _i8.Future<dynamic>.value(),
        returnValueForMissingStub: _i8.Future<dynamic>.value(),
      ) as _i8.Future<dynamic>);
}

/// A class which mocks [LoginService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginService extends _i1.Mock implements _i5.LoginService {
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set message(String? _message) => super.noSuchMethod(
        Invocation.setter(
          #message,
          _message,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.userData get UserData => (super.noSuchMethod(
        Invocation.getter(#UserData),
        returnValue: _FakeuserData_2(
          this,
          Invocation.getter(#UserData),
        ),
        returnValueForMissingStub: _FakeuserData_2(
          this,
          Invocation.getter(#UserData),
        ),
      ) as _i4.userData);
  @override
  set UserData(_i4.userData? _UserData) => super.noSuchMethod(
        Invocation.setter(
          #UserData,
          _UserData,
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ProfileService].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileService extends _i1.Mock implements _i12.ProfileService {
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set message(String? _message) => super.noSuchMethod(
        Invocation.setter(
          #message,
          _message,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.LoginService get loginService => (super.noSuchMethod(
        Invocation.getter(#loginService),
        returnValue: _FakeLoginService_3(
          this,
          Invocation.getter(#loginService),
        ),
        returnValueForMissingStub: _FakeLoginService_3(
          this,
          Invocation.getter(#loginService),
        ),
      ) as _i5.LoginService);
  @override
  _i2.FirebaseFirestore get firestore => (super.noSuchMethod(
        Invocation.getter(#firestore),
        returnValue: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
        returnValueForMissingStub: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestore),
        ),
      ) as _i2.FirebaseFirestore);
  @override
  set firestore(_i2.FirebaseFirestore? _firestore) => super.noSuchMethod(
        Invocation.setter(
          #firestore,
          _firestore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic updateProfile(
    String? email,
    dynamic password,
    dynamic firstName,
    dynamic lastName,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #updateProfile,
          [
            email,
            password,
            firstName,
            lastName,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ChatsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockChatsService extends _i1.Mock implements _i13.ChatsService {}

/// A class which mocks [ForgetpasswordService].
///
/// See the documentation for Mockito's code generation for more information.
class MockForgetpasswordService extends _i1.Mock
    implements _i14.ForgetpasswordService {}

/// A class which mocks [SettingService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingService extends _i1.Mock implements _i15.SettingService {}
