
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Model/EbookModel.dart';

class EbookService {
  
Stream<List<EbookModel>> eBookStream() {
    final stream = FirebaseFirestore.instance.collection("E Books").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return EbookModel.fromJson(doc.data());
        }).toList());
  }
Stream publisherStream(uID) {
    return FirebaseFirestore.instance.collection("users").doc(uID).snapshots();
  }
}
