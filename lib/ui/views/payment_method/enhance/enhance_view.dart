import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import 'enhance_viewmodel.dart';

class EnhanceView extends StackedView<EnhanceViewModel> {
  const EnhanceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EnhanceViewModel viewModel,
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
        // title: Text(
        //   "Slect Date & Time",
        //   textAlign: TextAlign.center,
        //   style: GoogleFonts.ibmPlexSans(
        //       fontSize: 18,
        //       color: const Color(0xff4873a6).withOpacity(0.7),
        //       fontWeight: FontWeight.w600),
        // ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
                child: Text(
              "Enhance your learning \nexperience with us",
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                  fontSize: 22, fontWeight: FontWeight.w600),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Center(
                child: Text(
              "Choose your pain that works for \n you.Cancel it anything",
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(fontSize: 11),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff4873a6).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Checkbox(
                      checkColor: const Color(0xff4873a6).withOpacity(0.7),
                      activeColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      value: viewModel.isChecked,
                      onChanged: (bool? value) => viewModel.update(value)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonText(text: "\$14.99 /Month", color: Colors.white),
                      SizedBox(height: 6),
                      SmallText(
                          text: "Get 1 month free trial", color: Colors.white)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff4873a6).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Checkbox(
                      checkColor: const Color(0xff4873a6).withOpacity(0.7),
                      activeColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      value: viewModel.isChecked1,
                      onChanged: (bool? value) => viewModel.update1(value)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonText(
                          text: "\$144.99 /12Month", color: Colors.white),
                      SizedBox(height: 6),
                      SmallText(
                          text: "Get 1 month free trial", color: Colors.white)
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: viewModel.navigateentercarddata,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.06)
          ],
        ),
      ),
    );
  }

  @override
  EnhanceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EnhanceViewModel();
}
