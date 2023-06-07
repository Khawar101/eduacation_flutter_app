import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import 'book_detail_viewmodel.dart';





class BookDetailView extends StatefulWidget {
  const BookDetailView({super.key});

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> with TickerProviderStateMixin {
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
    return ViewModelBuilder<BookDetailViewModel>.reactive(
        viewModelBuilder: () => BookDetailViewModel(),
        builder: (context, viewModel, child) {
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
                        backgroundColor: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/images.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: 'David Wolf',
                color: Colors.black,
                size: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 8,
              ),
              const ButtonText(text: 'Cold Lake', color: Colors.black),
              const SmallText(text: 'Jeff Carson', color: Colors.black),
              const SizedBox(height: 16),
              TabBar(
                indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xff4873a6).withOpacity(0.7),
                ),
                indicatorWeight: 1,
                indicatorPadding:
                    const EdgeInsets.only(bottom: 4, left: 20, right: 20),
                indicatorColor: const Color(0xff4873a6).withOpacity(0.7),
                controller: tabController,
                labelStyle: GoogleFonts.ibmPlexSans(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
                onTap: (value) {},
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
                tabs: const [
                  Tab(
                    text: 'Buy Ebook',
                  ),
                  Tab(
                    text: 'Buy Audio',
                  ),
                ],
              ),
              _getTabAtIndex(tabController.index),
            ],
          ),
        ),
      ),
    );

        });}
  
  }

  Widget _getTabAtIndex(int index) {
    var list = [
      Column(
        children: [
          const SizedBox(height: 10),
          const Align(
              alignment: Alignment.centerLeft,
              child: ButtonText(text: 'Best Seller', color: Colors.black)),
          const SizedBox(height: 10),
          Container(
            height: 190.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const BookDetailView())));
                  },
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
                            height: MediaQuery.of(context).size.height * 0.009),
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
      // 2nd tab bar
      Container(
        height: 200,
        color: Colors.green,
      ),
    ];
    return list[index];
  }

