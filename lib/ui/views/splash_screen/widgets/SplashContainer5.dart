import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../splash_screen_viewmodel.dart';

class SplashContainer5 extends StackedView<SplashScreenViewModel> {
  const SplashContainer5({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashScreenViewModel viewModel,
    Widget? child,
  ) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, view, child) => Scaffold(
        backgroundColor: const Color(0xffe5f1f8),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  //   width: double.infinity,
                  child: Image.asset(
                    'assets/images/girl-images-4.jpg',
                    fit: BoxFit.cover,
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Transform.scale(
                  scale: 1.65,

                  origin: const Offset(-5, 30),
                  // scaleX: 20,
                  // scaleY: 20,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(300),
                            topRight: Radius.circular(290)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.06),
                          Text(
                            'Explore it\nToday!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ibmPlexSans(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            'A handful of model sentence structures\nto generate lorem which looks reason \nable.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ibmPlexSans(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.044),
                          GestureDetector(
                            onTap: viewModel.navigateLogin,
                            child: CircularStepProgressIndicator(
                              totalSteps: 4,
                              currentStep: 4,
                              stepSize: 2,
                              selectedColor:
                                  const Color(0xff4873a6).withOpacity(0.7),
                              unselectedColor: Colors.grey[200],
                              padding: 0,
                              width: 40,
                              height: 40,
                              selectedStepSize: 2,
                              roundedCap: (_, __) => true,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.8,
                    top: MediaQuery.of(context).size.height * 0.33),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.orangeAccent),
                  child: Center(
                      child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Text(
                      'A+',
                      style: GoogleFonts.ibmPlexSans(
                        color: Colors.white,
                      ),
                    )),
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepOrangeAccent),
                  alignment: FractionalOffset.topRight,
                  transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -360),
                  child: Center(
                      child: Image.asset(
                    'assets/icons/book-64.png',
                    width: 27,
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.height * 0.36),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.grey),
                  child: Center(
                      child: Image.asset(
                    'assets/icons/react-native-50.png',
                    width: 40,
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.5,
                    top: MediaQuery.of(context).size.height * 0.06),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  child: Center(
                      child: Image.asset(
                    'assets/icons/graduation-cap.png',
                    width: 30,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SplashScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashScreenViewModel();
}
