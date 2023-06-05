import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'LineChart.dart';
import 'dashboard_model.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //  drawer: const DrawerHeaderPage(),
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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(
              "My Activity",
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
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: ((context) =>
                    //             const NotificationScreen())));
                  },
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: const LineChartView()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff4873a6).withOpacity(0.7)),
                  child: TabBar(
                    isScrollable: false,
                    //  indicatorColor: const Color(0xff3787ff),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.only(
                        left: 5, right: 5, top: 5, bottom: 5),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: [
                      Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Day",
                                style: GoogleFonts.ibmPlexSans(
                                    fontWeight: FontWeight.w700, fontSize: 18),
                              ))),
                      Tab(
                          child: Text(
                        "Week",
                        style: GoogleFonts.ibmPlexSans(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      )),
                    ],
                    //        controller: _tabController,
                    //         indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                    // physics: NeverScrollableScrollPhysics(),

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.025),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                225, 255, 193, 7),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Icon(
                                          Icons.done_outlined,
                                          color: Colors.white,
                                        )),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Class \nCompleted',
                                        style: GoogleFonts.ibmPlexSans(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '12',
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.white, fontSize: 26),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.025),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Icon(
                                          Icons.access_time_outlined,
                                          color: Colors.black,
                                        )),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Time \nDuration',
                                        style: GoogleFonts.ibmPlexSans(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '1h 46m',
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.white, fontSize: 26),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.025),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                225, 255, 193, 7),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Icon(
                                          Icons.done_outlined,
                                          color: Colors.white,
                                        )),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Class \nCompleted',
                                        style: GoogleFonts.ibmPlexSans(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '12',
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.white, fontSize: 26),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.025),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Icon(
                                          Icons.access_time_outlined,
                                          color: Colors.black,
                                        )),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Time \nDuration',
                                        style: GoogleFonts.ibmPlexSans(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '1h 46m',
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.white, fontSize: 26),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
