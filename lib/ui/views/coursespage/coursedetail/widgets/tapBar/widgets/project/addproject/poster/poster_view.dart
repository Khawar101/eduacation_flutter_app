import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'poster_viewmodel.dart';

class PosterView extends StackedView<PosterViewModel> {
  const PosterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PosterViewModel viewModel,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Halloween poster",
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    //  backgroundColor: Colors.black,
                    backgroundImage:
                        AssetImage('assets/images/profile-pic.jpg'),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ButtonText(text: "@mouni", color: Colors.black),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            "11 min ago",
                            style: GoogleFonts.ibmPlexSans(fontSize: 12),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          const CircleAvatar(radius: 1),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          Text(
                            "Student",
                            style: GoogleFonts.ibmPlexSans(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "Project associated with:",
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const ButtonText(
                text: "Comic drawing essential for eeryone!",
                color: Colors.black,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/tree.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "In the body, we have ListView.builder with itemcount 5 and itemBuilder which will create a new widget again and again up to 5 times because we have itemCount=5. If we don’t use itemCount in ListView.builder then we will get infinite list items so it is recommended to use itemCount to avoid such mistakes. The itemBuilder returns ListTile which has leading, trailing and title. This ListTile will build again and again up to 5 times.",
                style: GoogleFonts.ibmPlexSans(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Text(
                "In the body, we have ListView.builder with itemcountand . we will get infinite list items so it is recommended to use itemCount to avoid such mistakes. The itemBuilder returns List again up to 5 times.",
                style: GoogleFonts.ibmPlexSans(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.thumb_up_off_alt_outlined,
                    size: 24,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Text("21",
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 14,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      )),
                  const SizedBox(width: 40),
                  Icon(
                    Icons.remove_red_eye_outlined,
                    size: 24,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "150",
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 14,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PosterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PosterViewModel();
}
