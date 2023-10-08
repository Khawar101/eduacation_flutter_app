import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.router.dart';
import 'package:education/services/Model/chat.dart';
import 'package:education/services/chats_service.dart';
import 'package:education/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/Model/chat_member.dart';

class InboxViewModel extends BaseViewModel with WidgetsBindingObserver {
  final TextEditingController smsController = TextEditingController();
  final navigationService = locator<NavigationService>();
  final _navigationService = locator<NavigationService>();
  bool isTextEmpty = true;
  bool isGroup = false;
  String chatId = "";
  String otherUID = "";
  String name = "";
  String profile = "";
  List<ChatMember> chatMembers = [];
  List<Member> memberList = [];
  final _chatService = locator<ChatService>();
  final _loginService = locator<LoginService>();
  final loginService = locator<LoginService>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void initState() {
    smsController.addListener(updateTextStatus);
    WidgetsBinding.instance.addObserver(this);
    _loginService.setOnlineStatus(true);
    _startChatRoomsStream();
    isGroup = true;
    notifyListeners();
  }

  void _startChatRoomsStream() {
    setBusy(true);
    _chatService.getChatRoomsStream().listen((List<ChatMember> event) {
      chatMembers = event;
      setBusy(false);
      notifyListeners();
    });
  }

  openNewChat(Member member,chatMember) {
    otherUID = member.uID!.toString();
    name = member.name ?? "";
    profile = member.profile ?? "";
    String currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherUID]..sort();
    chatId = _chatID.join('_');
    memberList = [];

    notifyListeners();
    navgateBack(chatMember);
  }

  navgateBack(chatMember) {
    _navigationService.back();
    navigateinbox(chatMember);
  }

  navigateinbox(chatMember) {
    String currentuID = loginService.UserData.uID.toString();

    _navigationService.navigateToInboxView(
      chatId: chatId,
      uID: loginService.UserData.uID.toString(),
      name: name,
      profile: profile,
      otherUID: otherUID,
      isGroup: isGroup,
      memberList: chatMember.member!
          .where((member) => member.uID != currentuID)
          .toList(),
    );
  }

  void updateTextStatus() {
    isTextEmpty = smsController.text.isEmpty;
    notifyListeners();
  }

  Stream<List<Chat>> chatStream(chatId) {
    // notifyListeners();
    return _chatService.chatStream(chatId);
  }

  void sendSMS(chatId, name, profile, otherUID) {
    log(chatId);
    log(name);
    log(profile);
    log(otherUID);
    log(smsController.text);

    _chatService.sendSMS(chatId, name, profile, otherUID, smsController);
    notifyListeners();
  }

  Stream publisherStream(uID) {
    log("abv========>${uID}");
    return _chatService.publisherStream(uID);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        log('On Resume');
        _loginService.setOnlineStatus(true);
        break;
      case AppLifecycleState.inactive:
        log('On inactive');
        _loginService.setOnlineStatus(false);
        break;
      case AppLifecycleState.paused:
        log('On paused');
        _loginService.setOnlineStatus(false);
        break;
      case AppLifecycleState.detached:
        log('On detached');
        _loginService.setOnlineStatus(false);
        break;
      case AppLifecycleState.hidden:
        log('On hidden');
        _loginService.setOnlineStatus(false);
        break;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
