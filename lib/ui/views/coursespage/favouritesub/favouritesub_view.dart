import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import 'favouritesub_viewmodel.dart';

class FavouritesubView extends StackedView<FavouritesubViewModel> {
  const FavouritesubView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FavouritesubViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.data
        ? Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.15,
                  horizontal: 20),
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/download (1).jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const BigText(text: "Nothing is here!", color: Colors.black),
                  const BigSubText(
                      text:
                          "We found nothing in your save list!Want to\nhave some?Try something best"),
                  Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        color: const Color(0xff5085fc),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: ButtonText(
                            text: "Recomended", color: Colors.white)),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
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
                "My Favorites",
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 18,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
          shrinkWrap: true,
          itemCount: viewModel.loginService.UserData.favoriteCourses!.length,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            var courseKey = viewModel.loginService.UserData.favoriteCourses![index];
            return viewModel.favoritecousesBuilder(courseKey);
          }),
          );
  }

  @override
  FavouritesubViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavouritesubViewModel();
}
