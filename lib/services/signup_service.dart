// ignore_for_file: body_might_complete_normally_catch_error, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupService {
  var message = "";
  var profile;
  var userdata;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  EmailOTP myauth = EmailOTP();

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

  sendOtpS(nameCTRL, emailCTRL, passwordCTRL) async {
    String name = nameCTRL.text.trim();
    String email = emailCTRL.text.trim();
    String password = passwordCTRL.text.trim();
    if (name == "" || email == "" || password == "") {
      message = "filled all filed";
    } else {
      try {
        myauth.setConfig(
            appEmail: "khawarjutt101@gmail.com",
            appName: "Email OTP",
            userEmail: emailCTRL.text,
            otpLength: 6,
            otpType: OTPType.digitsOnly);
        if (await myauth.sendOTP() == true) {
          message = "OTP has been sent";
        } else {
          message = "OTP send failled";
        }
      } catch (e) {
        message = e.toString();
      }
    }
  }

  verify(otp) async {
    log('==>$otp');
    if (await myauth.verifyOTP(otp: otp) == true) {
      message = "verify correct";
    } else {
      message = 'incorrect otp';
    }
  }

  createAccount(nameCTRL, emailCTRL, passwordCTRL, gender) async {
    String name = nameCTRL.text.trim();
    String email = emailCTRL.text.trim();
    String password = passwordCTRL.text.trim();

    if (name == "" || email == "" || password == "") {
      message = "filled all filed";
    } else {
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        userdata = {
          "UID": user.user!.uid,
          "username": name,
          "email": email,
          "password": password,
          "profile": profile,
          "firstName": "",
          "lastName": "",
          "gender": gender,
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
}
