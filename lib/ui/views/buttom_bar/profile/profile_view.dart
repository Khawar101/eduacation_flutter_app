import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../widgets/app_utils.dart';
import '../../drawer/drawer_view.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.vertical_distribute_sharp,
                  color: Colors.black54,
                  size: 18,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
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
      // backgroundColor: const Color(0xffe4f1f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  viewModel.loginService.UserData.profile.toString()),
            ),
            const SizedBox(height: 10),
            Center(
                child: BigText(
              text: viewModel.loginService.UserData.username.toString(),
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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.07,
                  horizontal: MediaQuery.of(context).size.height * 0.03),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF4873A6).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.014),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Billed every year",
                                  style: GoogleFonts.ibmPlexSans(
                                      color: Colors.white, fontSize: 14),
                                ),
                                const SizedBox(height: 13),
                                Text(
                                  "12 months at \$8.00/month",
                                  style: GoogleFonts.ibmPlexSans(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                "Upgrade",
                                style: GoogleFonts.ibmPlexSans(
                                    fontSize: 15,
                                    color: const Color(0xFF4873A6)
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w400),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF4873A6).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BigText(
                                text: "Profile information",
                                color: Colors.white,
                              ),
                              GestureDetector(
                                onTap: viewModel.navigateEditProfile,
                                child: Image.asset(
                                  'assets/icons/pencil-book.png',
                                  scale: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.028,
                          ),
                          ButtonText(
                            text:
                                "Email: ${viewModel.loginService.UserData.email.toString()}",
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.024,
                          ),
                          ButtonText(
                            text:
                                "Password: ${viewModel.loginService.UserData.password.toString()}",
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.024,
                          ),
                          ButtonText(
                            text:
                                "First Name: ${viewModel.loginService.UserData.firstName.toString()}",
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.024,
                          ),
                          ButtonText(
                            text:
                                "Last Name: ${viewModel.loginService.UserData.lastName.toString()}",
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
