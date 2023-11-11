// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/app_utils.dart';
import 'forget_viewmodel.dart';

class PasswordChangeDoneView extends StackedView<ForgetViewModel> {
  const PasswordChangeDoneView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //   backgroundColor: const Color(0xffe4f1f8),
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.22,
            left: 20,
            right: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/icons/icons8-popper-confetti-96.png'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.085),
            const BigText(
              text: "Password Changed",
              color: Colors.black,
            ),
            const BigText(
              text: "Successfully!",
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            const BigSubText(
              text: "If you are going to use a passage of Lorem",
            ),
            const BigSubText(
              text: "lpusm.You need to be sure there isn't",
            ),
            const BigSubText(
              text: "anything embarrassing.",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            GestureDetector(
              onTap: () {
                viewModel.navigateLogin();
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
          ],
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
