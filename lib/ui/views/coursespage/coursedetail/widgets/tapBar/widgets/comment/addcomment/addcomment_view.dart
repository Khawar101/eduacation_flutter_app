import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'addcomment_viewmodel.dart';

class AddcommentView extends StackedView<AddcommentViewModel> {
  const AddcommentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddcommentViewModel viewModel,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1 Replies",
                        style: GoogleFonts.ibmPlexSans(fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color(0xff4873a6).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: ButtonText(
                            text: "Add reply",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //student section
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/profile-pic.jpg'),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ButtonText(
                                    text: "@mouni", color: Colors.black),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "11 min ago",
                                      style:
                                          GoogleFonts.ibmPlexSans(fontSize: 12),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    const CircleAvatar(radius: 1),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text(
                                      "Student",
                                      style:
                                          GoogleFonts.ibmPlexSans(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.17,
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: Text(
                            "What is NestedScrollView ? The Fluton defines kjfkjkl jhfuewhuj! ",
                            style: GoogleFonts.ibmPlexSans(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.17,
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SmallText(
                                    text: "Liked",
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05),
                                  Text(
                                    "Reply",
                                    style:
                                        GoogleFonts.ibmPlexSans(fontSize: 10),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_off_alt_outlined,
                                    size: 15,
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Text(
                                    "21",
                                    style:
                                        GoogleFonts.ibmPlexSans(fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //teacher section

                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/profile-pic.jpg'),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "@mouni",
                                  style: GoogleFonts.ibmPlexSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "11 min ago",
                                      style:
                                          GoogleFonts.ibmPlexSans(fontSize: 12),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    const CircleAvatar(radius: 1),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text(
                                      "Teacher",
                                      style:
                                          GoogleFonts.ibmPlexSans(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        //   SizedBox(height: MediaQuery.of(context).size.height*0.02),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.17,
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: Text(
                            "What is NestedScrollView ? The Fluton defines kjfkjkl jhfuewhuj! ",
                            style: GoogleFonts.ibmPlexSans(),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.17,
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SmallText(
                                    text: "Liked",
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05),
                                  Text(
                                    "Reply",
                                    style:
                                        GoogleFonts.ibmPlexSans(fontSize: 10),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_off_alt_outlined,
                                    size: 15,
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Text(
                                    "21",
                                    style:
                                        GoogleFonts.ibmPlexSans(fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: 70,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Write a comment",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 3),
              Icon(
                Icons.send_sharp,
                size: 30,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AddcommentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddcommentViewModel();
}
