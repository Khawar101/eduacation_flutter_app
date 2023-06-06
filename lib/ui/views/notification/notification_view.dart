import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_utils.dart';
import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            "Notifications",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                isScrollable: false,
                //  indicatorColor: const Color(0xff3787ff),
                ///     indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.only(bottom: 15),
                unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
                labelColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  insets: const EdgeInsets.symmetric(horizontal: 70.0),
                ),
                tabs: [
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.19),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            const Color(0xff4873a6).withOpacity(0.7),
                      ),
                    ),
                    iconMargin: const EdgeInsets.all(0),
                    child: Text(
                      "messages",
                      style: GoogleFonts.ibmPlexSans(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.25),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            const Color(0xff4873a6).withOpacity(0.7),
                      ),
                    ),
                    iconMargin: const EdgeInsets.all(0),
                    child: Text(
                      "notifications",
                      style: GoogleFonts.ibmPlexSans(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ],
                //        controller: _tabController,
                //    indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width * 0.06,
                      // right: MediaQuery.of(context).size.width * 0.06,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: SizedBox(
                    child: TabBarView(
                      //      physics: const NeverScrollableScrollPhysics(),
                      //   controller: _tabController,
                      children: [
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => const ChatPageScreen()));
                            },
                            child: ListView.builder(
                              itemCount: 7,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  child: Container(
                                    // height: MediaQuery.of(context).size.height,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff4873a6)
                                          .withOpacity(0.7),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.asset(
                                                            'assets/images/download.jpeg')),
                                                  ),
                                                  const SizedBox(width: 7),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Daniel Lawson",
                                                        style: GoogleFonts
                                                            .ibmPlexSans(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        "Online",
                                                        style: GoogleFonts
                                                            .ibmPlexSans(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "04:32 pm",
                                                style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          const SmallText(
                                              text:
                                                  "When dealing with technical commands that use a keyboard (for example, ",
                                              color: Colors.white),
                                          const SizedBox(height: 15),
                                          SizedBox(
                                            height: 160,
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  'assets/images/download (1).jpeg',
                                                  fit: BoxFit.fitWidth),
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
                        //Notification bar
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.02,
                                  //     horizontal: MediaQuery.of(context).size.width*0.025
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff4873a6)
                                          .withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.asset(
                                              'assets/icons/chat-message64.png',color: const Color(0xff4873a6)
                                          .withOpacity(0.7),
                                            ),
                                          ),
                                          // child: Image.asset(
                                          //     'assets/images/tree.jpg',
                                          //     fit: BoxFit.cover),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Congratulation on completing the  hygfyuhgfyuhfytv tdrt",
                                                overflow: TextOverflow.ellipsis,
                                                //  softWrap: true,
                                                maxLines: 1,
                                                style: GoogleFonts.ibmPlexSans(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time_filled,
                                                    size: 14,
                                                    color: Colors.white54,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "Just now",
                                                    style:
                                                        GoogleFonts.ibmPlexSans(
                                                            color:
                                                                Colors.white54,
                                                            fontSize: 12),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
 
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
