// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../../../widgets/app_utils.dart';

Widget complete(context){
  return      SizedBox(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/girl-images-4.jpg',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Adobe illustrator for all beginner artist",
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text(
                                    "Lesson 1",
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 14,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ReadMoreText(
                          'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
                          trimLines: 2,
                          trimLength: 80,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                          colorClickableText: Colors.black,
                          trimMode: TrimMode.Length,
                          trimCollapsedText: 'Read more',
                          moreStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          trimExpandedText: '...Show Less',
                          lessStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Resources for download",
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF4873A6).withOpacity(0.7),
                              ),
                              child: Center(
                                  child: Text(
                                ".img",
                                style: GoogleFonts.ibmPlexSans(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ButtonText(
                                  text: "practice class sketches",
                                  color: Colors.black,
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      ".img",
                                      style: GoogleFonts.ibmPlexSans(
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                    const SizedBox(width: 20),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "4",
                                          style: GoogleFonts.ibmPlexSans(
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                        ),
                                        TextSpan(
                                          text: "Mb",
                                          style: GoogleFonts.ibmPlexSans(
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                        ),
                                      ]),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/icons/download-cloud.png',
                          width: 26,
                          color: const Color(0xFF4873A6).withOpacity(0.7),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ));// SECOND ITEM
    
}