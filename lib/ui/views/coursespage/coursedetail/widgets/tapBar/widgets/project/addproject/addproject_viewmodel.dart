import 'dart:io';
import 'package:education/services/Model/CoursesModel.dart';
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
    List<StudentProjects> projectsList = []; 
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  //  String? corseKey ;
  // Future<void> sendImage(
  //   ImageSource source,
  //   uID,
  //   courseKey,
  // ) async {
  //   XFile? image;
  //   image = await ImagePicker().pickImage(source: source, imageQuality: 35);
  //   if (image == null) {
  //     throw Exception('No image selected');
  //   }
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child("profile/${DateTime.now().microsecondsSinceEpoch}");
  //   UploadTask uploadTask = ref.putFile(File(image.path));
  //   await uploadTask.whenComplete(() async {
  //     String uRL = await ref.getDownloadURL();
  //     // corseKey=corseKey;
  //     await FirebaseFirestore.instance
  //         .collection("courses")
  //         .doc(courseKey)
  //         .collection('projectData')
  //         .doc(uID)
  //         .set({'url': uRL,'description':projectDescription.text,'name':projectName.text,});
  //   }).catchError((onError) {
  //     debugPrint("=======>image error ${onError}");
  //     throw onError;
  //   });
  // }

//   Future<void> sendImage(
//   ImageSource source,
//    uID,
//    courseKey,
// ) async {
//   XFile? image;
//   image = await ImagePicker().pickImage(source: source, imageQuality: 35);
//   if (image == null) {
//     throw Exception('No image selected');
//   }

//   Reference ref = FirebaseStorage.instance
//       .ref()
//       .child("profile/${DateTime.now().microsecondsSinceEpoch}");
//   UploadTask uploadTask = ref.putFile(File(image.path));

//   try {
//     await uploadTask.whenComplete(() async {
//       String uRL = await ref.getDownloadURL();

//       // Add the new project to the list
//       Map<String, dynamic> newProject = {
//         'url': uRL,
//         'description': projectDescription.text,
//         'name': projectName.text,
//       };
//       // Retrieve the existing list of projects
//       List<Map<String, dynamic>> existingProjects = [];
//       await FirebaseFirestore.instance
//           .collection("courses")
//           .doc(courseKey)
//           .collection('projectData')
//           .doc(uID)
//           .get()
//           .then((doc) {
//         if (doc.exists) {
//           // existingProjects =
//           //     List<Map<String, dynamic>>.from(doc['projects'] ?? []);
//       existingProjects.add(newProject);
//         }
//       });


//       // Update the document with the updated list of projects
//       await FirebaseFirestore.instance
//           .collection("courses")
//           .doc(courseKey)
//           .collection('projectData')
//           .doc(uID)
//           .set({'projects': existingProjects});
//     });
//   } catch (error) {
//     debugPrint("=======>image error $error");
//     throw error;
//   }
// }



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

  try {
    await uploadTask.whenComplete(() async {
      String uRL = await ref.getDownloadURL();

      // Retrieve the existing list of projects
      List<Map<String, dynamic>> existingProjects = [];
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(courseKey)
          .collection('projectData')
          .doc(uID)
          .get()
          .then((doc) {
        if (doc.exists) {
          existingProjects =
              List<Map<String, dynamic>>.from(doc['projects'] ?? []);
        }
      });

      // Add the new project to the list
      Map<String, dynamic> newProject = {
        'url': uRL,
        'description': projectDescription.text,
        'name': projectName.text,
      };
      existingProjects.add(newProject);

      // Update the document with the updated list of projects
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(courseKey)
          .collection('projectData')
          .doc(uID)
          .set({'projects': existingProjects});
    });
  } catch (error) {
    debugPrint("=======>image error $error");
    throw error;
  }
}


 
  Future<void> addProject() async {
    // Assuming projectName and projectDescription are not null
    if (projectName.text.isNotEmpty && projectDescription.text.isNotEmpty) {
      // Create a new StudentProjects object
      StudentProjects newProject = StudentProjects(
        projectName: projectName.text,
        projectDescription: projectDescription.text,
        projectPhoto: [], // Initialize with an empty list, update this if you have photos
      );

      // Add the new project to the list
      projectsList.add(newProject);

      // Perform any additional logic here if needed

      // Clear the text controllers or perform any other cleanup
      projectName.clear();
      projectDescription.clear();

      // Notify listeners to update the UI
      notifyListeners();
    }
  }
}

