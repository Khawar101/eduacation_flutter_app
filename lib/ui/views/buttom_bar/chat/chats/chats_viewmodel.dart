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
  chatId(otherId) {
    var currentuID = loginService.UserData.uID.toString();
    List<String> chatID = [currentuID, otherId]..sort();
    return chatID.join('_');
  }

  navigateinbox(otherData) {
    _navigationService.navigateToInboxView(
        chatId: chatId(otherData['UID']), otherData: otherData);
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

  Stream<QuerySnapshot> getLastMessageStream(String chatId) {
    CollectionReference chatCollection = firestore.collection('chats');

    return chatCollection
        .where("chatId", isEqualTo: chatId)
        .orderBy('Date', descending: true)
        .limit(1)
        .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;
  }

  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();



      
}
