import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_utils.dart';
import 'popular_viewmodel.dart';

class PopularView extends StackedView<PopularViewModel> {
  const PopularView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PopularViewModel viewModel,
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
            "Popular Teachers",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/adjust-48.png',
                    width: 18,
                    color: Colors.black45,
                  )),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          // vertical: MediaQuery.of(context).size.height * 0.03
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: 13,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) =>
                        //             const TeacherBooking())));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.04),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                              //    vertical: MediaQuery.of(context).size.height * 0.009
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/images/download (1).jpeg',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    const ButtonText(
                                        text: "Adobe XD", color: Colors.white)
                                    //
                                  ],
                                ),
                                Container(
                                  height: 90,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '03',
                                              style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                          TextSpan(
                                              text: '\nYears',
                                              style: GoogleFonts.ibmPlexSans(
                                                  color: Colors.black,
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ), //Calender part
    );
 
  }

  @override
  PopularViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PopularViewModel();
}
