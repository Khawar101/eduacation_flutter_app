import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/app_utils.dart';
import '../notification_viewmodel.dart';

class NotificationWidget extends StackedView<NotificationViewModel> {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) => const ChatPageScreen()));
        },
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff4873a6).withOpacity(0.7),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                        'assets/images/download.jpeg')),
                              ),
                              const SizedBox(width: 7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Daniel Lawson",
                                    style: GoogleFonts.ibmPlexSans(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Online",
                                    style: GoogleFonts.ibmPlexSans(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            "04:32 pm",
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const SmallText(
                          text:
                              "When dealing with technical commands that use a keyboard (for example, ",
                          color: Colors.white),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/download (1).jpeg',
                              fit: BoxFit.fitWidth),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
