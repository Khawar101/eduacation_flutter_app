import 'package:firebase_auth/firebase_auth.dart';

class LoginService {


  //  TextEditingController emailCTRL =
  //     TextEditingController(text: "abc@gmail.com");
  // TextEditingController passwordCTRL = TextEditingController(text: "qwerty");

  // bool looding = false;
  // bool _obscureText = true;

  // // FlutterSecureStorage storage = const FlutterSecureStorage();

  // void register() async {

  //   var UserData;
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   final String useremail = emailCTRL.text.trim();
  //   final String userpassword = passwordCTRL.text;
  //   try {
  //     if (useremail != '' && userpassword != '') {
  //       final UserCredential user = await auth.signInWithEmailAndPassword(
  //           email: useremail, password: userpassword);
  //       final DocumentSnapshot snapshot =
  //           await firestore.collection("users").doc(user.user?.uid).get();
  //       // storage.write(key: "UID", value: user.user?.uid);
  //       final data = snapshot.data();
  //       setState(() {
  //         UserData = data;
  //       });
   
  //     } else {
  //       // snackbar("Please fill all text field");
  //     }
  //   } catch (e) {
  //     // snackbar(e.toString());
  //   }
  //     looding = false;
  // }

}
