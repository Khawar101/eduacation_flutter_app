import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class InboxViewModel extends BaseViewModel {
 
  final TextEditingController SMScontroller = TextEditingController();

  // void SentSMS() async {
    // String mergeuid = uid_merge(widget.UserData['UID'], widget.UID).toString();
    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    // String SMS = SMScontroller.text;
    // try {
    //   if (SMS != "") {
    //     FirebaseFirestore firestore = FirebaseFirestore.instance;
    //     CollectionReference users =
    //         FirebaseFirestore.instance.collection('users');
    //     await firestore
    //         .collection('chats')
    //         .doc(mergeuid)
    //         .collection(mergeuid)
    //         .doc()
    //         .set({
    //       "username": widget.UserData['username'],
    //       "email": widget.Email,
    //       "SMS": SMS,
    //       "Date": "${DateTime.now().millisecondsSinceEpoch}",
    //       "status": "seen",
    //       "type": "text"
    //     });
    //     SMScontroller.clear();

    //     // ScaffoldMessenger.of(context).showSnackBar(
    //     //   const SnackBar(
    //     //     content: Text('Sending....'),
    //     //   ),
    //     // );
    //   }
    // } catch (e) {
    //   // ScaffoldMessenger.of(context).showSnackBar(
    //   //   Bar(
    //   //     content: Text(e.toString()),
    //   //   ),
    //   // );
    // }
    // print([username, useremail, userpassword]);
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
  //   var now = new DateTime.now();
  //   var format = new DateFormat('HH:mm a');
  //   var Dateformat = new DateFormat('yyyy-MM-dd');
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

