import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../widgets/app_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'edit_info_viewmodel.dart';

class EditInfoView extends StackedView<EditInfoViewModel> {
  const EditInfoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditInfoViewModel viewModel,
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
          title: Text(
            "Profile",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: ((context) => const SettingScreen())));
                },
                child: const Icon(
                  Icons.settings_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            )
          ]),
      //   backgroundColor: const Color(0xffe4f1f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/download.jpeg'),
              child: Center(
                child: CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(
                    'assets/icons/gallery_icon.png',
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
                child: BigText(
              text: "Rakibull hassan",
              color: Colors.black,
            )),
            const SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.24),
              child: StepProgressIndicator(
                totalSteps: 100,
                currentStep: 60,
                size: 8,
                padding: 0,
                selectedColor: const Color(0xFF4873A6).withOpacity(0.7),
                unselectedColor: const Color(0xff767372),
                roundedEdges: const Radius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            const BigSubText(text: "60% complete your profile"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.045,
                  horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(
                      text: "Profile Information", color: Colors.black),
                  const SizedBox(height: 25),
                  const ButtonText(text: 'Email Address', color: Colors.black),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'E-Mail',
                  ),
                  const SizedBox(height: 20),
                  const ButtonText(text: "Password", color: Colors.black),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'Password',
                    isObscureText: viewModel.visibleCheck,
                    suffix: GestureDetector(
                      onTap: () {
                        viewModel.visibleCheck = !viewModel.visibleCheck;
                      },
                      child: Icon(
                        viewModel.visibleCheck == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ButtonText(text: "First Name", color: Colors.black),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'First Name',
                  ),
                  const SizedBox(height: 20),
                  const ButtonText(text: "Last Name", color: Colors.black),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'Last Name',
                  ),
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF4873A6).withOpacity(0.7),
                      ),
                      child: const Center(
                          child: ButtonText(text: 'Save', color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  EditInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditInfoViewModel();
}
