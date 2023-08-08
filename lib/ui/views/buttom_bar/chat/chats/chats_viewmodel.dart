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

  navigateinbox(otherData) {
    var currentuID = loginService.UserData.uID.toString();
    List<String> chatID = [currentuID, otherData['UID']]..sort();
    _navigationService.navigateToInboxView(
        chatId: chatID.join('_'), otherData: otherData);
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

  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
}
