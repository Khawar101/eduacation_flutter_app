import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../widgets/app_utils.dart';
import '../../widgets/custom_text_form_field.dart';
import 'e_learning_viewmodel.dart';

class ELearningView extends StackedView<ELearningViewModel> {
  const ELearningView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ELearningViewModel viewModel,
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
            "E-Learning",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.keyboard_command_key_rounded,
                color: Colors.black54,
                size: 20,
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BigText(
              text: "Welcome back",
              color: Colors.black,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.009),
            const BigText(
              text: "Saymon!",
              color: Colors.black,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            CustomTextFormField(
              hintText: 'Search for new knowledge!',
              suffix: const Icon(
                Icons.search_rounded,
                size: 18,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xff4873a6).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.09,
                            vertical:
                                MediaQuery.of(context).size.height * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ButtonText(
                              text: "Start learning",
                              color: Colors.white,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005),
                            const ButtonText(
                              text: "new Student!",
                              color: Colors.white,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: ((context) =>const CategoriesSearch())));
                              },
                              child: Container(
                                width: 110,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Categories",
                                        style: GoogleFonts.ibmPlexSans(
                                            fontSize: 12,
                                            color: const Color(0xff4873a6)
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt_rounded,
                                        color: const Color(0xff4873a6)
                                            .withOpacity(0.7),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text(
                      "Class in progress",
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.015),
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.018),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/icons/figma-48.png',
                                            width: 55),
                                        const SizedBox(width: 16),
                                        Text(
                                          "Figma",
                                          style: GoogleFonts.ibmPlexSans(
                                              color: const Color(0xffffffff)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "25%",
                                          style: GoogleFonts.ibmPlexSans(
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        CircularStepProgressIndicator(
                                          totalSteps: 100,
                                          currentStep: 25,
                                          selectedStepSize: 2,
                                          selectedColor: Colors.black,
                                          unselectedColor: Colors.white,
                                          unselectedStepSize: 2,
                                          padding: 0,
                                          width: 40,
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: Image.asset(
                                                  'assets/icons/sort-right-48-2.png'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ELearningViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ELearningViewModel();
}
