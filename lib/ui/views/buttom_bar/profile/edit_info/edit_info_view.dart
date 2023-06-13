import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../widgets/app_utils.dart';
import '../../../../widgets/custom_text_form_field.dart';
import 'edit_info_viewmodel.dart';

class EditInfoView extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phoneNo;
  final String address;
  final String clas;

  const EditInfoView(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.phoneNo,
      required this.address,
      required this.clas});

  @override
  State<EditInfoView> createState() => _EditInfoViewState();
}

class _EditInfoViewState extends State<EditInfoView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditInfoViewModel>.reactive(
        onModelReady: (viewModel) {
          viewModel.firstNameCTRL.text = widget.firstName;
          viewModel.lastNameCTRL.text = widget.lastName;
          viewModel.phoneNoCTRL.text = widget.phoneNo;
          viewModel.addressCTRL.text = widget.address;
        },
        viewModelBuilder: () => EditInfoViewModel(),
        builder: (context, viewModel, child) {
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
                      onTap: viewModel.navigateSetting,
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
                        CustomTextFormField(
                          hintText: 'Address',
                          // initialValue: widget. address,
                          controller: viewModel.addressCTRL,
                        ),
                        const SizedBox(height: 20),
                        const ButtonText(
                            text: "First Name", color: Colors.black),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hintText: 'First Name',
                          // initialValue: widget.firstName,
                          controller: viewModel.firstNameCTRL,
                        ),
                        const SizedBox(height: 20),
                        const ButtonText(
                            text: "Last Name", color: Colors.black),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hintText: 'Last Name',
                          // initialValue: widget.lastName,
                          controller: viewModel.lastNameCTRL,
                        ),
                        const SizedBox(height: 10),
                        const ButtonText(
                            text: 'Phone Number', color: Colors.black),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hintText: 'Phone No',
                          // initialValue: widget. phoneNo,
                          controller: viewModel.phoneNoCTRL,
                        ),
                        const SizedBox(height: 20),
                        const ButtonText(text: "Address", color: Colors.black),
                        const SizedBox(height: 35),
                        GestureDetector(
                          onTap: () {
                            viewModel.updatedProfile();
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF4873A6).withOpacity(0.7),
                            ),
                            child: const Center(
                                child: ButtonText(
                                    text: 'Save', color: Colors.white)),
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
        });
  }
}
