import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import 'verify_viewmodel.dart';

class VerifyView extends StackedView<VerifyViewModel> {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VerifyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //    backgroundColor: const Color(0xffe4f1f8),
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
        title: Text(
          "Verify Phone",
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexSans(
              fontSize: 18,
              color: const Color(0xff4873a6).withOpacity(0.7),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 1,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Code is sent to   ",
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "283 835 2999",
                            style: GoogleFonts.ibmPlexSans(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var i = 0; i < viewModel.codes.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                viewModel.codes[i],
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: SmallText(
                          text: "Didn't receive code?",
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
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
                          text: 'Verify and Create Account',
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: (value) =>
                    viewModel.onKeyboardTap(value, context),
                textColor: Colors.black,
                rightButtonFn: () {
                  for (var i = viewModel.codes.length - 1; i >= 0; i--) {
                    if (viewModel.codes[i].isNotEmpty) {
                      viewModel.clearCodeField(i, context);
                      break;
                    }
                  }
                },
                rightIcon: const Icon(
                  Icons.backspace,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  VerifyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyViewModel();
}
