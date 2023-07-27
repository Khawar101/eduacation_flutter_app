import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_utils.dart';
import '../../widgets/custom_text_form_field.dart';
import 'book_detail/all_booksCard.dart';
import 'e_book_viewmodel.dart';

class EBookView extends StackedView<EBookViewModel> {
  const EBookView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EBookViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: viewModel.navigateBack,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
              size: 18,
            ),
          ),
          title: Text(
            "E-Book",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: GestureDetector(
                onTap: viewModel.navigateNotification,
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black45,
                      size: 26,
                    ),
                    Positioned(
                      top: 3,
                      left: 2.5,
                      child: CircleAvatar(
                        radius: 4.5,
                        backgroundColor:
                            const Color(0xff4873a6).withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                "Explore, ebook! ",
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              CustomTextFormField(
                hintText: 'Search for new books!',
                suffix: const Icon(Icons.search),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const ButtonText(
                text: "All Books",
                color: Colors.black,
              ),

              Container(
                height: 230.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: const AllEBooks(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(
                height: 400,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: TabBar(
                      indicator: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      indicatorWeight: 1,
                      indicatorPadding:
                          const EdgeInsets.only(bottom: 4, left: 20, right: 20),
                      indicatorColor: const Color(0xff4873a6).withOpacity(0.7),
                      //controller: tabController,
                      labelStyle: GoogleFonts.ibmPlexSans(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                      onTap: (value) {},
                      labelColor: Colors.white,
                      unselectedLabelColor:
                          const Color(0xff4873a6).withOpacity(0.7),
                      tabs: const [
                        Tab(
                          text: 'Buy Ebook',
                        ),
                        Tab(
                          text: 'Buy Audio',
                        ),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        Container(
                          height: 200,
                          width: 70,
                          color: Colors.pink,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        'assets/images/ship-fever.jpg',
                                        width: 50,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Futurama The Untold Story",
                                          style: GoogleFonts.ibmPlexSans(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Nora M. Barrett",
                                          style: GoogleFonts.ibmPlexSans(
                                              fontSize: 12,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        RatingBar.builder(
                                          wrapAlignment: WrapAlignment.start,
                                          initialRating: 4.5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 15,
                                          ignoreGestures: true,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          onRatingUpdate: (rating) {
                                            //print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.black26,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      alignment: Alignment.topLeft,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Image.asset(
                                        'assets/images/ship-fever.jpg',
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Futurama The Untold Story",
                                          style: GoogleFonts.ibmPlexSans(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Nora M. Barrett",
                                          style: GoogleFonts.ibmPlexSans(
                                              fontSize: 12,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        RatingBar.builder(
                                          wrapAlignment: WrapAlignment.start,
                                          initialRating: 4.5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 15,
                                          ignoreGestures: true,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          onRatingUpdate: (rating) {
                                            //print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: 190.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      //onTap: viewModel.navigateBookDetail,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.04,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/ship-fever.jpg',
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.009),
                            Text(
                              "Futurama ",
                              style: GoogleFonts.ibmPlexSans(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "Nora M. Barrett",
                              style: GoogleFonts.ibmPlexSans(
                                  fontSize: 8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  EBookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EBookViewModel();
}
