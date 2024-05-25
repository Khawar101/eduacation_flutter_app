// ignore_for_file: body_might_complete_normally_catch_error, depend_on_referenced_packages
import 'package:stacked_services/stacked_services.dart';
import '../../../../../services/Model/chat_member.dart';
import 'package:education/services/chats_service.dart';
import 'package:education/services/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/chat.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:education/app/app.router.dart';
import '../../../../../app/app.locator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'dart:async';
import 'dart:io';

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

  openNewChat(Member member, chatMember) {
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

  void deleteMessage(chatId, id) {
    _chatService.deleteMessage(chatId, id);
    notifyListeners();
  }

  Stream publisherStream(uID) {
    // log("abv========>${uID}");
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

  sendImageWithCamera(source, chatId, name, profile, otherUID) {
    _chatService.sendImage(chatId, name, profile, otherUID, ImageSource.camera);
    notifyListeners();
  }

  sendImageWithGallery(source, chatId, name, profile, otherUID) {
    _chatService.sendImage(
        chatId, name, profile, otherUID, ImageSource.gallery);
    notifyListeners();
  }

  showPdfFile(chatId, name, profile, otherUID) {
    _chatService.sendPdf(chatId, name, profile, otherUID);
    notifyListeners();
  }

  // XFile? image;
  // Future sendImage(chatId, ImageSource source) async {
  //   image = await ImagePicker().pickImage(source: source, imageQuality: 35);
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child("profile/${DateTime.now().microsecondsSinceEpoch}");
  //   UploadTask uploadTask = ref.putFile(File(image!.path));
  //   // uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
  //   //   double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
  //   //     progressshow = progress;
  //   // });
  //   uploadTask.whenComplete(() async {
  //   String  uRL = await ref.getDownloadURL();
  //     Map<String, dynamic> messageData = {
  //       "SMS": uRL,
  //       "Date": "${DateTime.now().microsecondsSinceEpoch}",
  //       "type": "image",
  //       "UID": loginService.UserData.uID,
  //     };
  //     var docRef = firestore.collection("chatRoom").doc(chatId);
  //     docRef.get().then((doc) => {
  //           if (doc.exists)
  //             {
  //               docRef.update({"lastMessage": messageData})
  //             }
  //           else
  //             {
  //               docRef.set({
  //                 "Date": "${DateTime.now().microsecondsSinceEpoch}",
  //                 "member": [
  //                   {
  //                     "name": loginService.UserData.username,
  //                     "profile": loginService.UserData.profile,
  //                     "UID": loginService.UserData.uID
  //                   },
  //                   {"name": name, "profile": profile, "UID": otherUID},
  //                 ],
  //                 "membersUid": [loginService.UserData.uID, otherUID],
  //                 "lastMessage": messageData
  //               })
  //             }
  //         });
  //     await firestore
  //         .collection("chatRoom")
  //         .doc(chatId)
  //         .collection('chats')
  //         .doc()
  //         .set(messageData);
  //   }).catchError((onError) {
  //     log(onError);
  //     // snackBar(context, onError.toString());
  //   });
  // }

  // final sampleUrl = 'http://www.africau.edu/images/default/sample.pdf';

  String? pdfFlePath;

  Future<String> downloadAndSavePdf(sampleUrl) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sample.pdf');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(sampleUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf(sampleUrl) async {
    pdfFlePath = await downloadAndSavePdf(sampleUrl);
    notifyListeners();
  }
}
