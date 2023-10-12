// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:education/app/app.locator.dart';
import 'package:education/services/Model/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/login_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:education/services/Model/chat_member.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ChatService {
  List<Member> memberList = [];
  var progressshow = 0;
  var imageLoading = false;
  // String chatId = "";
  // String otherUID = "";
  // String name = "";
  // String profile = "";
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

  Future sendImage(chatId, name, profile, otherUID, ImageSource source) async {
    XFile? image;
    image = await ImagePicker().pickImage(source: source, imageQuality: 35);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profile/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask = ref.putFile(File(image!.path));
    // uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
    //   double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
    //     progressshow = progress;
    // });
    uploadTask.whenComplete(() async {
      String uRL = await ref.getDownloadURL();
      Map<String, dynamic> messageData = {
        "SMS": uRL,
        "Date": "${DateTime.now().microsecondsSinceEpoch}",
        "type": "image",
        "UID": loginService.UserData.uID,
      };
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
      await firestore
          .collection("chatRoom")
          .doc(chatId)
          .collection('chats')
          .doc()
          .set(messageData);
    }).catchError((onError) {
      log("=======>image error${onError}");
      // snackBar(context, onError.toString());
      throw onError;
    });
  }

  Future sendPdf(chatId, name, profile, otherUID) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );  log(result.toString());

      if (result != null) {
  // PlatformFile file = result.files.first;
   File file = File(result.files.single.path!);

    Reference ref = FirebaseStorage.instance
          .ref()
          .child("pdfs/${DateTime.now().microsecondsSinceEpoch}.pdf");
      UploadTask uploadTask = ref.putFile(file);

      uploadTask.whenComplete(() async {
        String uRL = await ref.getDownloadURL();
        Map<String, dynamic> messageData = {
          "SMS": uRL,
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "type": "pdf",
          "UID": loginService.UserData.uID,
        };
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
                    "lastMessage": messageData,
                  })
                }
            });
        await firestore
            .collection("chatRoom")
            .doc(chatId)
            .collection('chats')
            .doc()
            .set(messageData);
      }).catchError((onError) {
        log("=======>pdf error${onError}");
        // Handle the error as needed.
      });
    

  // log(file.name);
  // print(file.bytes);
  // print(file.size);
  // print(file.extension);
  // print(file.path);
} else {
  // User canceled the picker
}
    } catch (e) {
      log(e.toString());
    
    }
  }

  // Future sendPdf(chatId, name, profile, otherUID) async {

  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );
  //   log(result.toString());

  //   if (result != null) {
  //     File file = File(result.files.single.path!);

  //     Reference ref = FirebaseStorage.instance
  //         .ref()
  //         .child("pdfs/${DateTime.now().microsecondsSinceEpoch}.pdf");
  //     UploadTask uploadTask = ref.putFile(file);

  //     uploadTask.whenComplete(() async {
  //       String uRL = await ref.getDownloadURL();
  //       Map<String, dynamic> messageData = {
  //         "SMS": uRL,
  //         "Date": "${DateTime.now().microsecondsSinceEpoch}",
  //         "type": "pdf",
  //         "UID": loginService.UserData.uID,
  //       };
  //       var docRef = firestore.collection("chatRoom").doc(chatId);
  //       docRef.get().then((doc) => {
  //             if (doc.exists)
  //               {
  //                 docRef.update({"lastMessage": messageData})
  //               }
  //             else
  //               {
  //                 docRef.set({
  //                   "Date": "${DateTime.now().microsecondsSinceEpoch}",
  //                   "member": [
  //                     {
  //                       "name": loginService.UserData.username,
  //                       "profile": loginService.UserData.profile,
  //                       "UID": loginService.UserData.uID
  //                     },
  //                     {"name": name, "profile": profile, "UID": otherUID},
  //                   ],
  //                   "membersUid": [loginService.UserData.uID, otherUID],
  //                   "lastMessage": messageData,
  //                 })
  //               }
  //           });
  //       await firestore
  //           .collection("chatRoom")
  //           .doc(chatId)
  //           .collection('chats')
  //           .doc()
  //           .set(messageData);
  //     }).catchError((onError) {
  //       log("=======>pdf error${onError}");
  //       // Handle the error as needed.
  //     });
  //   } else {
  //     log("================================================>");
  //   }
  // }

//   Future sendPdf(chatId,name,profile,otherUID, ImageSource source) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles();

// if (result != null) {
//   File file = File(result.files.single.path);
// } else {
//   // User canceled the picker
// }

//     uploadTask.whenComplete(() async {
//       String uRL = await ref.getDownloadURL();
//       Map<String, dynamic> messageData = {
//         "SMS": uRL,
//         "Date": "${DateTime.now().microsecondsSinceEpoch}",
//         "type": "image",
//         "UID": loginService.UserData.uID,
//       };
//       var docRef = firestore.collection("chatRoom").doc(chatId);
//       docRef.get().then((doc) => {
//             if (doc.exists)
//               {
//                 docRef.update({"lastMessage": messageData})
//               }
//             else
//               {
//                 docRef.set({
//                   "Date": "${DateTime.now().microsecondsSinceEpoch}",
//                   "member": [
//                     {
//                       "name": loginService.UserData.username,
//                       "profile": loginService.UserData.profile,
//                       "UID": loginService.UserData.uID
//                     },
//                     {"name": name, "profile": profile, "UID": otherUID},
//                   ],
//                   "membersUid": [loginService.UserData.uID, otherUID],
//                   "lastMessage": messageData
//                 })
//               }
//           });
//       await firestore
//           .collection("chatRoom")
//           .doc(chatId)
//           .collection('chats')
//           .doc()
//           .set(messageData);
//     }).catchError((onError) {
//       log("=======>image error${onError}");
//       // snackBar(context, onError.toString());
//       throw onError;
//     });
//   }
}
