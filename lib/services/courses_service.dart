import 'package:cloud_firestore/cloud_firestore.dart';
import 'Model/CoursesModel.dart';

class CoursesService {
  Stream<List<CoursesModel>> coursesStream() {
    final stream = FirebaseFirestore.instance.collection("courses").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }

  Stream publisherStream(uID) {
    return FirebaseFirestore.instance.collection("users").doc(uID).snapshots();
  }

  Stream<List<CoursesModel>> buyCoursesStream(courseKey) {
    final stream = FirebaseFirestore.instance
        .collection("courses")
        .where("publishDate", isEqualTo: courseKey)
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }
}
