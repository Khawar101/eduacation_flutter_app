import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsService {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      // .orderBy('index', descending: true)
      // .where('index', isGreaterThan: '3')
      // .limitToLast(2)
      .snapshots();
}
