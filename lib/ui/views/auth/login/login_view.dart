import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/app_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //  backgroundColor: const Color(0xffe4f1f8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.14),
              Center(
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        width: 1),
                  ),
                  child: Icon(
                    Icons.lock,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    size: 34,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const BigText(
                text: 'Welcome Back!',
                color: Colors.black,
              ),
              const SizedBox(height: 6),
              const BigSubText(
                text: 'A handful of model sentence structures',
              ),
              const SizedBox(height: 25),
              CustomTextFormField(
                controller: viewModel.emailCTRL,
                hintText: 'Email id',
                prefix: const Icon(
                  Icons.mail_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    //    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomTextFormField(
                      controller: viewModel.passwordCTRL,
                      hintText: 'Password',
                      isObscureText: viewModel.visibleCheck,
                      prefix: GestureDetector(
                        onTap: viewModel.visible_check,
                        child: Icon(
                          viewModel.visibleCheck == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //  height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xff4873a6).withOpacity(0.7),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, //background color of button
                        side: BorderSide.none, //border width and color
                        elevation: 0, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {}, //_authenticateWithBiometrics,
                      child: const Icon(
                        Icons.fingerprint,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  viewModel.navigateForget();
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.ibmPlexSans(
                      decoration: TextDecoration.underline,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  viewModel.logIN(context);             
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: ButtonText(
                    text: 'Sign in',
                    color: Colors.white,
                  )),
                ),
              ),
              const SizedBox(height: 15),
              Row(children: [
                const Expanded(
                    child: Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                )),
                Text(
                  "OR",
                  style: GoogleFonts.ibmPlexSans(fontSize: 12),
                ),
                const Expanded(
                    child: Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                )),
              ]),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/google-48.png',
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sign in with Google',
                    style: GoogleFonts.ibmPlexSans(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SmallText(
                      text: 'Dont have an account? ', color: Colors.black),
                  GestureDetector(
                    onTap: () {
                      viewModel.navigateSignup();
                    },
                    child: SmallText(
                      text: 'Sign up',
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
