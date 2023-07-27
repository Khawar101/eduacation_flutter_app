import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/app_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'forget_viewmodel.dart';
import 'otp_view.dart';

class ForgetView extends StackedView<ForgetViewModel> {
  const ForgetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                text: "Forgot Password",
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              const BigSubText(
                text: "A handful of model sentence structure",
              ), //
              const SizedBox(height: 25),
              CustomTextFormField(
                // controller: viewModel.emailCTRL,
                hintText: 'Email id',
                prefix: const Icon(
                  Icons.mail_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),

              GestureDetector(
                onTap: () {
                  viewModel.login("mudassirmukhtar@gmail.com", "123456");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpView()),
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
                    text: 'Continue',
                    color: Colors.white,
                  )),
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'We Sent a',
                  style: GoogleFonts.ibmPlexSans(
                      color: Colors.black, fontSize: 12),
                  children: const [
                    TextSpan(
                      text: ' Verification code ',
                      style: TextStyle(
                        color: Color(0xff4873a6),
                      ),
                    ),
                    TextSpan(text: 'to your\n Email Address.'),
                  ],
                ),
              ),
            ],
          ),
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
