// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:developer';
import 'package:education/app/app.locator.dart';
import 'package:education/services/Model/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/login_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:education/services/Model/chat_member.dart';
import 'package:flutter/material.dart';

class ChatService {
  List<Member> memberList = [];
  var progressshow = 0;
  var imageLoading = false;
  final loginService = locator<LoginService>();
  String get uID => loginService.UserData.uID.toString();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<ChatMember> chatMembers = [];
  TextEditingController searchCTRL = TextEditingController();
  bool isTextEmpty = true;
  Timer? onlineTimer;

  Stream<List<Chat>> chatStream(chatId) {
    try {
      final stream = firestore
          .collection("chatRoom")
          .doc(chatId)
          .collection('chats')
          .orderBy("Date", descending: true)
          .snapshots();
      return stream.map((event) => event.docs.map((doc) {
            return Chat.fromJson(doc.data());
          }).toList());
    } catch (e) {
      log("Error fetching chat data: $e");
      return Stream.error("Error fetching chat data: $e");
    }
  }

  Stream<List<ChatMember>> getChatRoomsStream() async* {
    final result = firestore
        .collection('chatRoom')
        .where('membersUid', arrayContains: uID)
        // .orderBy('lastMessage.Date', descending: true)
        .snapshots();
    await for (final event in result) {
      final List<ChatMember> chatRooms = List.empty(growable: true);
      for (final doc in event.docs) {
        final data = doc.data();
        chatRooms.add(ChatMember.fromJson(data));
      }
      yield chatRooms;
    }
  }

  Stream publisherStream(uID) {
    return FirebaseFirestore.instance.collection("users").doc(uID).snapshots();
  }

  void sendSMS(chatId, name, profile, otherUID, smsController) async {
    // String mergeuid = uid_merge(widget.UserData['UID'], widget.UID).toString();
    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    String sms = smsController.text;
    try {
      if (sms != "") {
        Map<String, dynamic> messageData = {
          "SMS": sms,
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "type": "text",
          "UID": loginService.UserData.uID,
        };
        smsController.clear();
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        var docRef = firestore.collection("chatRoom").doc(chatId);
        docRef.get().then((doc) => {
              if (doc.exists)
                {
                  docRef.update({"lastMessage": messageData})
                }
              else
                {
                  docRef.set({
                    "Date": "${DateTime.now().microsecondsSinceEpoch}",
                    "member": [
                      {
                        "name": loginService.UserData.username,
                        "profile": loginService.UserData.profile,
                        "UID": loginService.UserData.uID
                      },
                      {"name": name, "profile": profile, "UID": otherUID},
                    ],
                    "membersUid": [loginService.UserData.uID, otherUID],
                    "lastMessage": messageData
                  })
                }
            });
        // var data = await firestore
        //     .collection("chatRoom")
        //     .doc(chatId)
        //     .update({"lastMessage": messageData});
        await firestore
            .collection("chatRoom")
            .doc(chatId)
            .collection('chats')
            .doc()
            .set(messageData);
      }
    } catch (e) {
      log("=======>${e.toString()}");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(e.toString()),
      //   ),
      // );
    }
  }

  // void uploadImage({required Function(File file) onSelected}) {
  //   FileUploadInputElement uploadInput = FileUploadInputElement()
  //     ..accept = "image/*, video/*, application/pdf";
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) {
  //     final file = uploadInput.files!.first;
  //     final reader = FileReader();
  //     reader.readAsDataUrl(file);
  //     reader.onLoadEnd.listen((event) {
  //       onSelected(file);
  //     }); // Pass the selected file to the callback function.
  //   });
  // }

//

  // Future uploadToStorage(smsController, name, profile, otherUID, chatId) async {
  //   // final dateTime = DateTime.now();
  //   uploadImage(
  //     onSelected: (File file) {
  //       Reference ref = storage
  //           .ref()
  //           .child("chatImage/${DateTime.now().microsecondsSinceEpoch}");
  //       UploadTask uploadTask = ref.putBlob(file);
  //       uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
  //         double progress =
  //             (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
  //         imageLoading = true;
  //         progressshow = progress.round();
  //         // notifyListeners();
  //       });
  //       uploadTask.whenComplete(() async {
  //         var imageUrl = await ref.getDownloadURL();
  //         Map<String, dynamic> messageData = {
  //           "SMS": imageUrl,
  //           "Date": "${DateTime.now().microsecondsSinceEpoch}",
  //           "type": file.name.split(".").last,
  //           "UID": loginService.UserData.uID,
  //         };
  //         smsController.clear();
  //         FirebaseFirestore firestore = FirebaseFirestore.instance;
  //         var docRef = firestore.collection("chatRoom").doc(chatId);
  //         docRef.get().then((doc) => {
  //               if (doc.exists)
  //                 {
  //                   docRef.update({"lastMessage": messageData})
  //                 }
  //               else
  //                 {
  //                   docRef.set({
  //                     "Date": "${DateTime.now().microsecondsSinceEpoch}",
  //                     "member": [
  //                       {
  //                         "name": loginService.UserData.username,
  //                         "profile": loginService.UserData.profile,
  //                         "UID": loginService.UserData.uID
  //                       },
  //                       {"name": name, "profile": profile, "UID": otherUID},
  //                     ],
  //                     "membersUid": [loginService.UserData.uID, otherUID],
  //                     "lastMessage": messageData
  //                   })
  //                 }
  //             });
  //         // var data = await firestore
  //         //     .collection("chatRoom")
  //         //     .doc(chatId)
  //         //     .update({"lastMessage": messageData});
  //         await firestore
  //             .collection("chatRoom")
  //             .doc(chatId)
  //             .collection('chats')
  //             .doc()
  //             .set(messageData);

  //         imageLoading = false;
  //         // _videoPlayerController.play();
  //       }).catchError((onError) {
  //         log(onError);
  //         // snackBar2(context, onError.toString());
  //       });
  //     },
  //   );
  //   return null;
  // }
}

