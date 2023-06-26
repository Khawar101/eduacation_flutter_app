import 'package:education/ui/views/setting/more_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_utils.dart';
import 'setting_viewmodel.dart';

class SettingView extends StackedView<SettingViewModel> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingViewModel viewModel,
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
            "Setting",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomText(
                    text: 'Save',
                    size: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4873a6).withOpacity(0.7)),
              ),
            )
          ]),
      //   backgroundColor: const Color(0xffe4f1f8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF4873A6).withOpacity(0.7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonText(
                        text: 'Connect to Facebook',
                        color: const Color(0xFF4873A6).withOpacity(0.7),
                      ),
                      Switch(
                        thumbIcon: viewModel.thumbIcon,
                        activeColor: const Color(0xFF4873A6).withOpacity(0.7),
                        activeTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor:
                            const Color(0xFF4873A6).withOpacity(0.7),
                        splashRadius: 5000,
                        value: viewModel.light0,
                        onChanged: (bool value) {
                          viewModel.upadtelight0(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MoreCard("R", "Beta", () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MoreCard(Icons.notifications_active, "Notification", () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MoreCard(Icons.surround_sound_sharp, "Learning & sound setting",
                  () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF4873A6).withOpacity(0.7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.dark_mode,
                            size: 18,
                            color: const Color(0xFF4873A6).withOpacity(0.7),
                          ),
                          const SizedBox(width: 10),
                          ButtonText(
                            text: 'Dark Mode',
                            color: const Color(0xFF4873A6).withOpacity(0.7),
                          ),
                        ],
                      ),
                      Switch(
                        thumbIcon: viewModel.thumbIcon,
                        activeColor: const Color(0xFF4873A6).withOpacity(0.7),
                        activeTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor:
                            const Color(0xFF4873A6).withOpacity(0.7),
                        splashRadius: 5000,
                        value: viewModel.light1,
                        onChanged: (bool value) {
                          viewModel.upadtelight1(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MoreCard(Icons.question_mark, "Help", () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MoreCard(
                  Icons.logout, "Log Out", viewModel.settingService.signOut),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MoreCard("", "Privacy Policy", () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MoreCard("", "Terms of Use", () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SettingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingViewModel();
}
