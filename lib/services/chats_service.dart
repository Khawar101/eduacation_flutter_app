// ignore_for_file: avoid_web_libraries_in_flutter, unnecessary_brace_in_string_interps, body_might_complete_normally_catch_error
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:education/services/Model/chat_member.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:education/services/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/chat.dart';
import 'package:education/app/app.locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:async';
import 'dart:io';

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
            // log(doc.id.toString());
            return Chat.fromJson(doc.data(), docId: doc.id);
          }).toList());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:chatStream(chatId))",
          printDetails: true,
          fatal: true);
      log("Error fetching chat data: $e");
      return Stream.error("Error fetching chat data: $e");
    }
  }

  Stream<List<ChatMember>> getChatRoomsStream() async* {
    try {
      final result = firestore
          .collection('chatRoom')
          .where('membersUid', arrayContains: uID)
          .snapshots();
      await for (final event in result) {
        final List<ChatMember> chatRooms = List.empty(growable: true);
        for (final doc in event.docs) {
          final data = doc.data();
          chatRooms.add(ChatMember.fromJson(data));
        }
        yield chatRooms;
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:getChatRoomsStream",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }

  Stream publisherStream(uID) {
    try {
      return FirebaseFirestore.instance
          .collection("users")
          .doc(uID)
          .snapshots();
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:publishStram(uID)",
          printDetails: true,
          fatal: true);
      log(e.toString());
      return Stream.error(e.toString());
    }
  }

  void sendSMS(chatId, name, profile, otherUID, smsController) async {
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
        await firestore
            .collection("chatRoom")
            .doc(chatId)
            .collection('chats')
            .doc()
            .set(messageData);
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:sendSMS()", printDetails: true, fatal: true);
      log(e.toString());
   
    }
  }

  void deleteMessage(chatId, id) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore
          .collection("chatRoom")
          .doc(chatId)
          .collection('chats')
          .doc(id)
          .delete();
      log("message will be deleted");
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      log("Error occurred while deleting message: $e");
    }
  }

  Future sendImage(chatId, name, profile, otherUID, ImageSource source) async {
    XFile? image;
    image = await ImagePicker().pickImage(source: source, imageQuality: 35);
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("profile/${DateTime.now().microsecondsSinceEpoch}");
      UploadTask uploadTask = ref.putFile(File(image!.path));
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
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:sendImage()", printDetails: true, fatal: true);
      log(e.toString());
    }
  }

  Future sendPdf(chatId, name, profile, otherUID) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      log(result.toString());

      if (result != null) {
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
        });
      } else {}
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:sendPdf", printDetails: true, fatal: true);
      log(e.toString());
    }
  }
}
