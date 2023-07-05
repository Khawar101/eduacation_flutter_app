import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                "My save list",
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 18,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: GestureDetector(
                        onTap: viewModel.navigatecoursedetail,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/girl-images-4.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Physics",
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.ibmPlexSans(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.favorite,
                                            color: const Color(0xff4873a6)
                                                .withOpacity(0.7),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 18,
                                        ignoreGestures: true,
                                        itemPadding:
                                            const EdgeInsets.only(right: 6),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          size: 12,
                                          color: const Color(0xff4873a6)
                                              .withOpacity(0.7),
                                        ),
                                        onRatingUpdate: (rating) {
                                          // print(rating);
                                        },
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '34',
                                                style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                'Reviews',
                                                style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '100%',
                                                style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                'Response Rate',
                                                style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
  }

  @override
  FavouritesubViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavouritesubViewModel();
}
