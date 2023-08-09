import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../../app/app.locator.dart';

class InboxViewModel extends BaseViewModel {
  final TextEditingController smsController = TextEditingController();
  bool isTextEmpty = true;
  void initState() {
    smsController.addListener(updateTextStatus);
    notifyListeners();
  }

  void updateTextStatus() {
    isTextEmpty = smsController.text.isEmpty;
    notifyListeners();
  }

  final loginService = locator<LoginService>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesStream(String chatId) {
    CollectionReference chatCollection = firestore.collection('chats');

    return chatCollection
        .where("chatId", isEqualTo: chatId)
        .orderBy('Date', descending: true)
        .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;
  }

  Future<String> fetchUserName(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> userDoc =
        await firestore.collection('users').doc(userId).get();
    return userDoc.data()?['name'] ?? '';
  }

  void sentSMS(chatId, context) async {
    // String mergeuid = uid_merge(widget.UserData['UID'], widget.UID).toString();
    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    String sms = smsController.text;
    try {
      if (sms != "") {
        smsController.clear();
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore.collection('chats').doc().set({
          "chatId": chatId,
          "SMS": sms,
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "status": "seen",
          "type": "text",
          "UID": loginService.UserData.uID,
        });

        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Sending....'),
        //   ),
        // );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
  //     .collection('chats')
  //     .doc(mergeuid)
  //     .collection(mergeuid)
  //     .orderBy('Date', descending: true)
  //     // .where('index', isGreaterThan: '3')
  //     // .limitToLast(2)
  //     .snapshots();

  // dateFormate() {
  //   var now = DateTime.now();
  //   var format = DateFormat('HH:mm a');
  //   var Dateformat = DateFormat('yyyy-MM-dd');
  //   var date =
  //       new DateTime.fromMicrosecondsSinceEpoch(int.parse(data["Date"]) * 1000);
  //   var diff = date.difference(now).abs();
  //   var time = '';
  //   if (diff.inSeconds <= 0 ||
  //       diff.inSeconds > 0 && diff.inMinutes == 0 ||
  //       diff.inMinutes > 0 && diff.inHours == 0 ||
  //       diff.inHours > 0 && diff.inDays == 0) {
  //     time = format.format(date);
  //   } else {
  //     if (diff.inDays < 10) {
  //       time = diff.inDays.toString() + ' Day Ago';
  //     } else {
  //       time = Dateformat.format(date);
  //     }
  //   }
  // }
}
