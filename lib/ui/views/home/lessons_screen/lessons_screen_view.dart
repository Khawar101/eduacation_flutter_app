import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'lessons_screen_viewmodel.dart';

class LessonsScreenView extends StackedView<LessonsScreenViewModel> {
  const LessonsScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LessonsScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      // drawer: const DrawerHeaderPage(),
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              height: 30,
              width: 110,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff4873a6).withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.language,
                    size: 18,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "English",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 15,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: ((context) => const NotificationScreen())));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: LessonsScreenViewModel.itemsnames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF4873A6).withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Center(
                                child: CustomText(
                              text: LessonsScreenViewModel.itemsnames[index],
                              color: Colors.white,
                              size: 13,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 7, // Replace with the actual item count
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen2()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(
                                //       color: const Color(0xff4873a6)
                                //           .withOpacity(0.1),
                                //     )),
                                // color: const Color(0xff5085fc),

                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          border: Border.all(
                                            color: const Color(0xff4873a6)
                                                .withOpacity(0.1),
                                          )),
                                      child: Image.asset(
                                        'assets/images/promotion.png',
                                        width: 150,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: const Color(0xFF4873A6)
                                            .withOpacity(0.7),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Marketing',
                                                  style:
                                                      GoogleFonts.ibmPlexSans(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  '\$50',
                                                  style:
                                                      GoogleFonts.ibmPlexSans(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'By: Salim',
                                              style: GoogleFonts.ibmPlexSans(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Divider(
                                              thickness: 1,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '50',
                                                      style: GoogleFonts
                                                          .ibmPlexSans(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      'Lesson',
                                                      style: GoogleFonts
                                                          .ibmPlexSans(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      '4.5',
                                                      style: GoogleFonts
                                                          .ibmPlexSans(
                                                        color: Colors.white,
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
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xff4873a6).withOpacity(0.2),
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                          vertical: MediaQuery.of(context).size.height * 0.03),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2, left: 1),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ButtonText(
                                    text: 'All Lesson of Marketing',
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Here 52 Lesson and complete 32 lesson',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle_outlined,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      'what is marketing?',
                                      style: GoogleFonts.ibmPlexSans(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '56 Minutes',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle_outlined,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      'what is your defination of marketing?',
                                      style: GoogleFonts.ibmPlexSans(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '10 Minutes',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle_outlined,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      'what are 3 definatin of marketing?',
                                      style: GoogleFonts.ibmPlexSans(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '56 Minutes',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.play_circle_outline_rounded,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      'what are the 4 type of marketing?',
                                      style: GoogleFonts.ibmPlexSans(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '56 Minutes',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.play_circle_outline_rounded,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      'what the marketing is important? ',
                                      style: GoogleFonts.ibmPlexSans(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '56 Minutes',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.play_circle_outline_rounded,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      'what is marketing necessary?',
                                      style: GoogleFonts.ibmPlexSans(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '56 Minutes',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LessonsScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LessonsScreenViewModel();
}
