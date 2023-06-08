import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';

class ChatsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateinbox() {
    _navigationService.navigateToInboxView();
  }
  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
  //   .collection('users')
  //   // .orderBy('index', descending: true)
  //   // .where('index', isGreaterThan: '3')
  //   // .limitToLast(2)
  //   .snapshots();

  //  StreamBuilder<QuerySnapshot>(
  //     stream: _usersStream,
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Something went wrong');
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: LoadingFadingLine.circle(),
  //         );
  //       }

  //       return ListView(
  //         children: snapshot.data!.docs.map((DocumentSnapshot document) {
  //           Map<String, dynamic> data =
  //               document.data()! as Map<String, dynamic>;
  //           return Text("data");
  //         }).toList(),
  //       );
}
