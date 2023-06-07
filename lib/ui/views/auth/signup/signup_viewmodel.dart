// ignore_for_file: non_constant_identifier_names

import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();

  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  navigateVerify() {
    _navigationService.navigateToVerifyView();
  }



  void createAccount() async{
  String name=nameController.text.trim();
  String email=emailController.text.trim();
  String password=passwordController.text.trim();
  String number=numberController.text.trim();

  if(name== "" || email== "" || password== "" || number== "" ){
    print("Please fill empty field!");
  }
  else{
    try{
       UserCredential userCredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
       if(password.length < 6){
    print("Please fill empty field!");
    log(password);
      SnackBar(
        content: Text('Password must be at least 6 characters long.'),
     
    );
  }
     else if(userCredential.user!=null){
           Navigator.push(context, CupertinoPageRoute(builder: (context)=>  VerifyScreen(verificationId: email,) ));
       
       }
  
  
   log('User Created!');
    } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    log('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    log('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
  // else if(password !=password){
  //   print("password do not match")

  // }
}

void sendOTP() async {
  String number= "+92" + numberController.text.trim();
    String password = passwordController.text.trim();
  // log(number);
    if (password.length < 6) {
    log('The password provided is too too weak.');
    return;
  }
  
  log(number);
  try{

  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: number,
   
     codeSent: ( verificationId,  resendToken) {
      log(verificationId);
      log("resendToken");
      Navigator.push(context, CupertinoPageRoute(builder: (context)=>  VerifyScreen(verificationId: verificationId) ));
     },
     verificationCompleted: (PhoneAuthCredential credential){
      log("verification done");
     }, 
     verificationFailed: (ex){
      print(ex.code.toString());
      log("verification failed");
     }, 
    
     codeAutoRetrievalTimeout: (verificationId){},
     timeout: Duration(seconds: 60),
    );
      } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    
    log('The password provided is too too weak.');
  } else if (e.code == 'email-already-in-use') {
    log('The account already exists for that email.');
  }
} 
      catch(e){
        print(e);
      }
}


}
