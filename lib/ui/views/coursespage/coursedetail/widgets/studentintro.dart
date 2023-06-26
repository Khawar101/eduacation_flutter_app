// ignore_for_file: unnecessary_import

import 'package:education/services/Model/CoursesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/app_utils.dart';

Widget studentintro(context, PublisherData data) {
  return Column(
    children: [
      // Container(
      //   height: 30,
      //   width: 60,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     color: const Color(0xff4873a6).withOpacity(0.7),
      //   ),
      //   child: const Center(
      //       child: ButtonText(
      //     text: 'HOT',
      //     color: Colors.white,
      //   )),
      // ),
      // const SizedBox(height: 15),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(data.profile.toString()),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.name.toString(),
                  style: GoogleFonts.ibmPlexSans(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              const ButtonText(text: 'Teacher', color: Colors.black45)
            ],
          ),
        ],
      ),
      const SizedBox(height: 8),
    ],
  );
}
