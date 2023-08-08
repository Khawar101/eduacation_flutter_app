import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/Model/userData.dart';
import '../../../../../services/login_service.dart';
import '../inbox/inbox_view.dart';

class ChatsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  // navigateinbox(String chatId, BuildContext context) {
    // _navigationService.navigateToInboxView();
    void navigateinbox(String chatId, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InboxView(chatId: chatId), // Replace InboxPage with your actual inbox page
      ),
    );
  }
  // }


  navigateEditProfile(userData data) async {
    await _navigationService.navigateToEditInfoView(
      firstName: data.firstName ?? "",
      lastName: data.lastName ?? "",
      phoneNo: data.phoneNo ?? "",
      address: data.address ?? "",
      clas: data.clas ?? "",
    );
    rebuildUi();
  }

  // if (UserData == null) {
  //     await firestore.collection("users").doc().set({
  //       "profile": profile,
  //       "email": emailCNTR.text,
  //       "password": passwordCNTR.text
  //     });


   Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();


      
 

  



}
