import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'my_courses_viewmodel.dart';

class MyCoursesView extends StackedView<MyCoursesViewModel> {
  const MyCoursesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyCoursesViewModel viewModel,
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
            "Courses",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              onPressed: viewModel.navigatefavouritesubject,
            ),
            const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Image(
                  image: AssetImage('assets/icons/icons8-adjust.png'),
                  color: Colors.black54,
                  width: 28,
                ))
          ]),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: viewModel.loginService.UserData.buyCourses!.length,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            var courseKey = viewModel.loginService.UserData.buyCourses![index];
            return viewModel.cousesBuilder(courseKey);
          }),
    );
  }

  @override
  MyCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyCoursesViewModel();
}
