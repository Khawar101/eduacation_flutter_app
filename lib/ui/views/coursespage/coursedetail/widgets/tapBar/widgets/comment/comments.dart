// ignore_for_file: unnecessary_import

import 'package:education/ui/views/coursespage/coursedetail/widgets/tapBar/widgets/comment/addcomment/addcomment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../widgets/app_utils.dart';

Widget comments(context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '5',
                    style: GoogleFonts.ibmPlexSans(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: '  Comments',
                    style: GoogleFonts.ibmPlexSans(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddcommentView()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF4873A6).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                    child: Text(
                  "Add comment",
                  style: GoogleFonts.ibmPlexSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
          )
        ],
      ),
      const SizedBox(height: 30),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
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
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
                            const CircleAvatar(radius: 1),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
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
                //   SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.16,
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
                            color: const Color(0xff4873a6).withOpacity(0.7),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Text(
                            "Reply",
                            style: GoogleFonts.ibmPlexSans(fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up_off_alt_outlined,
                            size: 15,
                            color: const Color(0xff4873a6).withOpacity(0.7),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Text(
                            "21",
                            style: GoogleFonts.ibmPlexSans(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}
