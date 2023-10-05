import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.router.dart';
import 'package:education/services/Model/chat.dart';
import 'package:education/services/Model/chat_member.dart';
import 'package:education/services/chats_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/Model/userData.dart';
import '../../../../../services/login_service.dart';

class ChatsViewModel extends BaseViewModel {
  String chatId = "";
  String otherUID = "";
  String name = "";
  String profile = "";
  bool isGroup = false;
  List<Member> memberList = [];
  TextEditingController searchCTRL = TextEditingController();
  List<ChatMember> chatMembers = [];
  final _navigationService = locator<NavigationService>();
  final loginService = locator<LoginService>();
  final _chatService = locator<ChatService>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void initState() {
    _startChatRoomsStream();
  }

  openNewChat(Member member) {
    otherUID = member.uID!.toString();
    name = member.name ?? "";
    profile = member.profile ?? "";
    String currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherUID]..sort();
    chatId = _chatID.join('_');
    memberList = [];
    notifyListeners();
  }

  setChatId(ChatMember chatMember) {
    String currentuID = loginService.UserData.uID.toString();

    if (chatMember.group == null) {
      if (chatMember.member![0].uID != currentuID) {
        openNewChat(chatMember.member![0]);
      } else {
        openNewChat(chatMember.member![1]);
      }
      isGroup = true;
    } else {
      isGroup = false;
      otherUID = chatMember.group!.key ?? "";
      chatId = chatMember.group!.key ?? "";
      name = chatMember.group!.name ?? "";
      profile = chatMember.group!.profile ?? "";
      memberList = chatMember.member!
          .where((member) => member.uID != currentuID)
          .toList();
    }
    notifyListeners();
    navigateinbox();
  }

  Stream<List<Chat>> chatStream() {
    notifyListeners();
    return _chatService.chatStream(chatId);
  }

  void _startChatRoomsStream() {
    setBusy(true);
    _chatService.getChatRoomsStream().listen((List<ChatMember> event) {
      chatMembers = event;
      setBusy(false);
      notifyListeners();
    });
  }

  Member cruntUserData(ChatMember chatMember) {
    Member _member = Member();
    String currentuID = loginService.UserData.uID.toString();
    if (chatMember.group == null) {
      if (chatMember.member![0].uID != currentuID) {
        _member.uID = chatMember.member![0].uID!.toString();
        _member.name = chatMember.member![0].name!.toString();
        _member.profile = chatMember.member![0].profile!.toString();
      } else {
        _member.uID = chatMember.member![1].uID!.toString();
        _member.name = chatMember.member![1].name!.toString();
        _member.profile = chatMember.member![1].profile!.toString();
      }
    } else {
      _member.uID = chatMember.group!.key ?? "";
      _member.name = chatMember.group!.name ?? "";
      _member.profile = chatMember.group!.profile ?? "";
    }

    // // If the logged-in user is in memberList, remove them
    // if (memberList.any((member) => member.uID == currentuID)) {
    //   memberList.removeWhere((member) => member.uID == currentuID);
    // }

    notifyListeners();
    return _member;
  }

  Stream publisherStream(uID) {
    return _chatService.publisherStream(uID);
  }

  cruntUserName(chatMember) {
    Member _member = cruntUserData(chatMember);
    // log("============${chatMember}");
    return _member.name;
  }

  cruntUserProfile(chatMember) {
    Member _member = cruntUserData(chatMember);
    return _member.profile;
  }

  navigateinbox() {
    _navigationService.navigateToInboxView(
        chatId: chatId,
        uID: loginService.UserData.uID.toString(),
        name: name,
        profile: profile,
        otherUID: otherUID);
  }

  List<ChatMember> _filteredChatMembers = [];

  // Getter to access the filtered chat members
  List<ChatMember> get filteredChatMembers => _filteredChatMembers;

  // Method to filter chat members based on search text
  void filterChatMembers(String searchText) {
    if (searchText.isEmpty) {
      // If search text is empty, show all chat members
      _filteredChatMembers = chatMembers;
    } else {
      // If search text is not empty, filter chat members by name or other criteria
      _filteredChatMembers = chatMembers.where((_chatMember) {
        // Replace this condition with your filtering criteria
        if (_chatMember.group == null) {
          if (_chatMember.member![0].uID != loginService.UserData.uID) {
            return _chatMember.member![0].name!
                .toLowerCase()
                .contains(searchText.toLowerCase());
          } else {
            return _chatMember.member![1].name!
                .toLowerCase()
                .contains(searchText.toLowerCase());
          }
        } else {
          return _chatMember.group!.name!
              .toLowerCase()
              .contains(searchText.toLowerCase());
        }
      }).toList();
    }
    // Notify listeners that the filtered data has changed
    notifyListeners();
  }

  //  chatId1(otherId) {
  //   var currentuID = loginService.UserData.uID.toString();
  //   List<String> chatID = [currentuID, otherId]..sort();
  //   return chatID.join('_');
  // }

  // navigateEditProfile(userData data) async {
  //   await _navigationService.navigateToEditInfoView(
  //     firstName: data.firstName ?? "",
  //     lastName: data.lastName ?? "",
  //     phoneNo: data.phoneNo ?? "",
  //     address: data.address ?? "",
  //     clas: data.clas ?? "",
  //   );

  //   rebuildUi();
  // }

  // Stream<QuerySnapshot> getLastMessageStream(String chatId) {
  //   CollectionReference chatCollection = firestore.collection('chats');

  //   return chatCollection
  //       .where("chatId", isEqualTo: chatId)
  //       .orderBy('Date', descending: true)
  //       .limit(1)
  //       .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;
  // }

  // Stream collectionStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();

  // final Stream<QuerySnapshot> usersStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();
}
