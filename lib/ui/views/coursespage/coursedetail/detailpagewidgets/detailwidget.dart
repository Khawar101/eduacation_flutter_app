import 'dart:developer';
import 'package:education/ui/views/coursespage/coursedetail/detailpagewidgets/studentintro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/video_player.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({super.key});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  // ignore: unused_field
  int _currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(_tabSelect);

    super.initState();
  }

  void _tabSelect() {
    log("Tab index is ${tabController.index}");
    setState(() {
      _currentIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              "Details",
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
                  Icons.bookmark_border_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
              )
            ]),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(children: [
                  const videoPlayer(
                      url:
                          "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                      studentintro(context),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  TabBar(
                    indicatorWeight: 1,
                    indicatorPadding: const EdgeInsets.only(bottom: 4),
                    indicatorColor: const Color(0xff4873a6).withOpacity(0.7),
                    controller: tabController,
                    labelStyle: GoogleFonts.ibmPlexSans(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                    onTap: (value) {},
                    labelColor: Colors.black,
                    unselectedLabelColor:
                        const Color(0xff4873a6).withOpacity(0.7),
                    tabs: const [
                      Tab(
                        text: 'Overview',
                      ),
                      Tab(
                        text: 'Completed',
                      ),
                    ],
                  ),
                  // _getTabAtIndex(tabController.index),
                ])),
              ),
            ],
          ),
        ));
  }
}
