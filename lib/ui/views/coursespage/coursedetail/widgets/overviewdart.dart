// ignore_for_file: unnecessary_import

import 'package:education/ui/views/coursespage/coursedetail/detailpagewidgets/widgets/overviewtabwidgets/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../../../../widgets/app_utils.dart';
import 'overviewtabwidgets/comments.dart';
import 'overviewtabwidgets/feedback.dart';

Widget overview(context) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Introduction",
            style: GoogleFonts.ibmPlexSans(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          ReadMoreText(
            'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
            trimLines: 2,
            trimLength: 80,
            style: TextStyle(color: Colors.black.withOpacity(0.7)),
            colorClickableText: Colors.black,
            trimMode: TrimMode.Length,
            trimCollapsedText: 'Read more',
            moreStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            trimExpandedText: '...Show Less',
            lessStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF4873A6).withOpacity(0.7),
            ),
            child: const Center(
                child: ButtonText(text: 'See more', color: Colors.white)),
          ),
          const SizedBox(height: 30),
          feedback(context),
          const SizedBox(height: 30),
          project(context),
          const SizedBox(height: 30),
          comments(context)
        ],
      ),
    ),
  );
  // Second ITEM of tabbarview
}
