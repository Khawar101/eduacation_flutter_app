import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/app_utils.dart';
import '../../drawer/drawer_view.dart';
import 'widgets/getTabwidget.dart';

class StudentInformationView extends StatefulWidget {
  const StudentInformationView({super.key});

  @override
  State<StudentInformationView> createState() => _StudentInformationViewState();
}

class _StudentInformationViewState extends State<StudentInformationView>
    with TickerProviderStateMixin {
  late TabController tabController;
  // ignore: unused_field
  int _currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
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
      drawer: const DrawerView(),
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
          title: Text(
            "Student Info",
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
                Icons.share_outlined,
                color: Colors.black54,
                size: 20,
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/profile_picture.jpeg'),
                ),
              ),
              const SizedBox(height: 4),
              const BigText(text: "@annymori", color: Colors.black),
              const SizedBox(height: 4),
              Text(
                "Professinol comic book artist\nand full time art teacher",
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: ButtonText(
                              text: "teacher", color: Colors.black))),
                  const SizedBox(width: 10),
                  Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: ButtonText(text: "Follow", color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xff4873a6).withOpacity(0.7),
                            width: 1)),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons8-fb-24.png',
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xff4873a6).withOpacity(0.7),
                            width: 1)),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/instagram-48.png',
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xff4873a6).withOpacity(0.7),
                            width: 1)),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons8-twitter-48.png',
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TabBar(
                indicatorWeight: 1,
                indicatorPadding: const EdgeInsets.only(bottom: 4),
                indicatorColor: const Color(0xff4873a6).withOpacity(0.7),
                controller: tabController,
                labelStyle: GoogleFonts.ibmPlexSans(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
                onTap: (value) {},
                labelColor: Colors.black,
                unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
                tabs: const [
                  Tab(
                    icon: Text("23"),
                    text: "Project",
                  ),
                  Tab(icon: Text("23"), text: "Courses"),
                  Tab(icon: Text("23"), text: "Following"),
                ],
              ),
              tabController.index == 0
                  ? Project(context)
                  : tabController.index == 1
                      ? Courses(context)
                      : Following(context)
            ],
          ),
        ),
      ),
    );
  }
}
