import 'dart:developer';
import 'dart:io';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/login_service.dart';
import 'package:education/services/subscription_service.dart';
import 'package:education/services/courses_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:education/services/rating_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:education/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddprojectViewModel extends BaseViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //services call
  final ratingService = locator<RatingService>();
  final subscriptionService = locator<SubscriptionService>();
  final coursesService = locator<CoursesService>();
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();
//locator
   String? get uID => _loginService.UserData.uID;
// list
  List<StudentProjects> projectsList = [];
  List<String> imageList = [];
// controller
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();

  navigationBack() {
    _navigationService.back();
  }

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

  // String? uRL;

  Future<void> sendImage(ImageSource source) async {
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
        imageList.add(uRL);
        notifyListeners();
        // Add the new project to the list
      });
    } catch (error) {
      log("=======>image error $error");
      throw error;
    }
  }
 

  uploadProject(courseKey) async {
    Map<String, dynamic> newProject = {
      'url': imageList,
      'description': projectDescription.text,
      'name': projectName.text,
      'uid':uID
    };
    // existingProjects.add(newProject);

    // Update the document with the updated list of projects
    try {
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(courseKey)
          .collection('projectData')
          .doc()
          .set(newProject);
    } catch (e) {
      log("======upload data===$e");
    }
  }

  Future<void> addProject() async {
    // Assuming projectName and projectDescription are not null
    if (projectName.text.isNotEmpty && projectDescription.text.isNotEmpty) {
      // Create a new StudentProjects object
      StudentProjects newProject = StudentProjects(
        name: projectName.text,
        description: projectDescription.text,
        url: [], // Initialize with an empty list, update this if you have photos
      );

      // Add the new project to the list
      projectsList.add(newProject);

      // Perform any additional logic here if needed

      // Clear the text controllers or perform any other cleanup
      projectName.clear();
      projectDescription.clear();
      imageList.clear();
      navigationBack();
      // Notify listeners to update the UI
      notifyListeners();
    }
  }
}
