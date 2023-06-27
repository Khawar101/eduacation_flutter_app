import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import 'detail_viewmodel.dart';

class DetailView extends StackedView<DetailViewModel> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailViewModel viewModel,
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
          title: Text(
            "Teacher Detail",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/girl-images-4.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       height: 40,
              //       width: 40,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //               color: const Color(0xff4873a6).withOpacity(0.7),
              //               width: 1)),
              //       child: Center(
              //           child: Icon(
              //         Icons.phone,
              //         color: const Color(0xff4873a6).withOpacity(0.7),
              //       )),
              //     ),
              //     const SizedBox(width: 15),
              //     Container(
              //       height: 40,
              //       width: 40,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //               color: const Color(0xff4873a6).withOpacity(0.7),
              //               width: 1)),
              //       child: Center(
              //           child: Icon(
              //         Icons.chat,
              //         color: const Color(0xff4873a6).withOpacity(0.7),
              //       )),
              //     ),
              //     const SizedBox(width: 15),
              //     Container(
              //       height: 40,
              //       width: 40,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //               color: const Color(0xff4873a6).withOpacity(0.7),
              //               width: 1)),
              //       child: Center(
              //           child: Icon(
              //         Icons.video_call_sharp,
              //         color: const Color(0xff4873a6).withOpacity(0.7),
              //       )),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      text: 'Sheikh All Ralhan',
                      size: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  Row(
                    children: [
                      const CustomText(
                          text: '5.0',
                          size: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.star,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        size: 18,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const ButtonText(text: 'UX/UI Research', color: Colors.black45),
              const SizedBox(height: 10),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ButtonText(text: 'Experience', color: Colors.black45),
                  ButtonText(text: '10 Years', color: Colors.black45),
                ],
              ),
              const SizedBox(height: 10),
              const ButtonText(text: 'About', color: Colors.black),
              const SizedBox(height: 10),
              const CustomText(
                  text:
                      'When COVID-19 hit the world back in March, many areas of our lives were affected. To survive through these unpredictable days at home, people were desperate to get their hands a few things like toilet papers, Nintendo Switch, water, and baking or cooking tools. For the parents of young children, there was one addition to the list: a teacher. As the children stayed home, parents realized the amount of work, energy, and knowledge is required to teach, play, feed, and stay with the little ones. “I don’t know how you did it every day, Ms. Chloe” one parent texted me.',
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: viewModel.navigateSlectDate,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: ButtonText(
                    text: 'BOOK A SCHEDULE',
                    color: Colors.white,
                  )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailViewModel();
}
