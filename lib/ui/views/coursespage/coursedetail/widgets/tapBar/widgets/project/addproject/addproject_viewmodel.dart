import 'dart:io';
import 'package:education/services/subscription_service.dart';
import 'package:education/services/courses_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:education/services/rating_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:education/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddprojectViewModel extends BaseViewModel {
  final ratingService = locator<RatingService>();
  final subscriptionService = locator<SubscriptionService>();
  final coursesService = locator<CoursesService>();
  // final _loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  //  String? corseKey ;
  Future<void> sendImage(
    ImageSource source,
    uID,
    courseKey,
  ) async {
    XFile? image;
    image = await ImagePicker().pickImage(source: source, imageQuality: 35);
    if (image == null) {
      throw Exception('No image selected');
    }
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profile/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask = ref.putFile(File(image.path));
    await uploadTask.whenComplete(() async {
      String uRL = await ref.getDownloadURL();
      // corseKey=corseKey;
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(courseKey)
          .collection('projectData')
          .doc(uID)
          .set({'url': uRL});
    }).catchError((onError) {
      debugPrint("=======>image error ${onError}");
      throw onError;
    });
  }

  
}
