import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupService {
  void createAccount(nameCTRL, emailCTRL, passwordCTRL) async {
    String name = nameCTRL.text.trim();
    String email = emailCTRL.text.trim();
    // String number = numberCTRL.text.trim();
    String password = passwordCTRL.text.trim();

    if (name == "" || email == "" || password == "") {
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (password.length < 6) {
          log(password);
          const SnackBar(
            content: Text('Password must be at least 6 characters long.'),
          );
        } else if (userCredential.user != null) {
          //  Navigator.push(context, CupertinoPageRoute(builder: (context)=>  VerifyScreen(verificationId: email,) ));
        }

        log('User Created!');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          log('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          log('The account already exists for that email.');
        }
      } catch (e) {
        throw Exception(e);
      }
    }
    // else if(password !=password){
    //   print("password do not match")

    // }
  }
}
