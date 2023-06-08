// ignore_for_file: body_might_complete_normally_catch_error

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupService {
  var message = "";
  var profile;
  var userdata;

  // config() {
  //   print("O=====>");
  //   emailAuth.config({"server": "server url", "serverKey": "serverKey"});
  // }
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final XFile? image;
  Future pickImage() async {
    image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 45);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profile/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask = ref.putFile(File(image!.path));
    // uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
    //   double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
    //     progressshow = progress;

    // });
    uploadTask.whenComplete(() async {
      profile = await ref.getDownloadURL();
      log(profile);
      // FirebaseFirestore firestore = FirebaseFirestore.instance;

      // await firestore.collection("users").doc(widget.UserData["UID"]).update({
      //   "profile": url,
      // });
      // widget.UserData["profile"] = url;
    }).catchError((onError) {
      log(onError);
      // snackBar(context, onError.toString());
    });
    return profile;
  }

  createAccount(nameCTRL, emailCTRL, passwordCTRL) async {
    String name = nameCTRL.text.trim();
    String email = emailCTRL.text.trim();
    // String number = numberCTRL.text.trim();
    String password = passwordCTRL.text.trim();

    if (name == "" || email == "" || password == "") {
      message = "filled all filed";
    } else {
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // if (password.length < 6) {
        //   log(password);
        //   const SnackBar(
        //     content: Text('Password must be at least 6 characters long.'),
        //   );
        //   return null;
        // } else if (userCredential.user != null) {
        // }
        userdata = {
          "UID": user.user!.uid,
          "username": name,
          "email": email,
          "password": password,
          "profile": profile,
          "firstName": "",
          "lastName": "",
        };
        await firestore.collection("users").doc(user.user!.uid).set(userdata);
        log(user.toString());

        message = "Login Successfully";
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        }
      } catch (e) {
        message = e.toString();
      }
    }
  }

  verify(otp, email) {
    bool result = (EmailAuth.validate(
        receiverMail:
            email.value.text, //to make sure the email ID is not changed
        userOTP: otp.value.text)); //pass in the OTP typed in
    ///This will return you a bool, and you can proceed further after that, add a fail case and a success case (result will be true/false)

    if (!result) {
      message = "enter Correct OTP";
    }

    return result;
  }

  /// a void funtion to send the OTP to the user
  /// Can also be converted into a Boolean function and render accordingly for providers
  sendOtpS(emailCTRL) async {
    try {
      ///Accessing the EmailAuth class from the package
      EmailAuth.sessionName = "Sample";

      ///a boolean value will be returned if the OTP is sent successfully
      var result = await EmailAuth.sendOtp(receiverMail: emailCTRL.text);

      if (result) {
        message = "OTP sent Successfully";
      }
      log(result.toString());
    } catch (e) {
      log("=====>${e.toString()}");
    }
  }
}
