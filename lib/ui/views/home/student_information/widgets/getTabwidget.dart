// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/app_utils.dart';

Widget Project(context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02, top: 12),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/Paul-Wilson.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
          );
        }),
  );
}

Widget Courses(context) {
  return Column(
    children: [
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02, top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/tree.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adobe illustrator for all beginner artist",
                            softWrap: true,
                            maxLines: 3,
                            style: GoogleFonts.ibmPlexSans(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.009),
                          const ButtonText(
                              text: "Samule Doe", color: Colors.black45),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.009),
                          Row(
                            children: [
                              const Icon(
                                Icons.person_2_outlined,
                                color: Colors.black45,
                                size: 15,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01),
                              const SmallText(
                                  text: "4k student", color: Colors.black45),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05),
                              Icon(
                                Icons.star,
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                size: 15,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              const SmallText(
                                  text: "4.7", color: Colors.black45),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ],
  );
}

Widget Following(context) {
  return Column(
    children: [
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/profile-pic.jpg'),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.025),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonText(
                              text: "Sammuel jonass", color: Colors.black),
                          SmallText(text: "@jdoe", color: Colors.black45)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: SmallText(text: "Follow", color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
