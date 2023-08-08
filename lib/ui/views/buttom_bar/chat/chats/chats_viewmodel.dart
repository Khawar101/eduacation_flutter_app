import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/Model/userData.dart';
import '../../../../../services/login_service.dart';

class ChatsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  navigateinbox() {
    _navigationService.navigateToInboxView();
  }


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
