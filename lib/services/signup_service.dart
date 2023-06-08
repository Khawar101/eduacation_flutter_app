// ignore_for_file: body_might_complete_normally_catch_error

import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupService {
  var signupMessage = "";
  var message = "";
  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

  config() {
    print("O=====>");
    emailAuth.config({"server": "server url", "serverKey": "serverKey"});
  }

  late final XFile? image;
  pickImage() async {
    image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 45);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask = ref.putFile(File(image!.path));
    // uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
    //   double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
    //     progressshow = progress;

    // });
    uploadTask.whenComplete(() async {
      var url = await ref.getDownloadURL();
      FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
      print(url);
      // FirebaseFirestore firestore = FirebaseFirestore.instance;

      // await firestore.collection("users").doc(widget.UserData["UID"]).update({
      //   "profile": url,
      // });
      // widget.UserData["profile"] = url;
    }).catchError((onError) {
      print(onError);
      // snackBar(context, onError.toString());
    });
  }

  late UserCredential userdata;
  createAccount(nameCTRL, emailCTRL, passwordCTRL) async {
    String name = nameCTRL.text.trim();
    String email = emailCTRL.text.trim();
    // String number = numberCTRL.text.trim();
    String password = passwordCTRL.text.trim();

    if (name == "" || email == "" || password == "") {
      signupMessage = "filled all filed";
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // if (password.length < 6) {
        //   log(password);
        //   const SnackBar(
        //     content: Text('Password must be at least 6 characters long.'),
        //   );
        //   return null;
        // } else if (userCredential.user != null) {
        // }

        signupMessage = "Login Successfully";
        userdata = userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          signupMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          signupMessage = 'The account already exists for that email.';
        }
      } catch (e) {
        signupMessage = e.toString();
      }
    }
  }

  verify(otp) {
    bool result = emailAuth.validateOtp(
        recipientMail: otp.value.text, userOtp: otp.value.text);
    if (!result) {
      message = "enter Correct OTP";
    }
    return result;
  }

  /// a void funtion to send the OTP to the user
  /// Can also be converted into a Boolean function and render accordingly for providers
  sendOtpS(emailCTRL) async {
    try {
      bool result = await emailAuth.sendOtp(
          recipientMail: emailCTRL.value.text, otpLength: 5);
      if (result) {
        message = "OTP sent Successfully";
      }
      log(result.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
