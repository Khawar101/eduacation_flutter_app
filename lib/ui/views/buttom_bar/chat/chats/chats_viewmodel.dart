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
