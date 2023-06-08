import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'change_doneView.dart';
import 'forget_viewmodel.dart';

class ChangePasswordView extends StackedView<ForgetViewModel> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      //  backgroundColor: const Color(0xffe4f1f8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              // ignore: prefer_const_literals_to_create_immutables
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
                    child: Center(
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Image.asset(
                            'assets/icons/lock-icon.png',
                          ))),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const BigText(
                  text: "Change Password",
                  color: Colors.black,
                ),
                const SizedBox(height: 8),
                const BigSubText(
                  text: "Your Password length consists of ",
                ),
                const BigSubText(
                  text: "6 characters",
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'New Password',
                      isObscureText: viewModel.visibleCheck,
                      suffix: GestureDetector(
                        onTap: viewModel.visible_check,
                        child: Icon(
                          viewModel.visibleCheck == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    CustomTextFormField(
                        hintText: 'Confirm Password',
                        isObscureText: viewModel.visibleCheck2,
                        suffix: GestureDetector(
                          onTap: viewModel.visible_check2,
                          child: Icon(
                            viewModel.visibleCheck2 == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordChangeDoneView()),
                    );
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
                      text: 'Save Password',
                      color: Colors.white,
                    )),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  @override
  ForgetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgetViewModel();
}
