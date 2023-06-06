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
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.02,
              //     horizontal: MediaQuery.of(context).size.width*0.025
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff4873a6).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/icons/chat-message64.png',
                          color: const Color(0xff4873a6).withOpacity(0.7),
                        ),
                      ),
                      // child: Image.asset(
                      //     'assets/images/tree.jpg',
                      //     fit: BoxFit.cover),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.035),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Congratulation on completing the  hygfyuhgfyuhfytv tdrt",
                            overflow: TextOverflow.ellipsis,
                            //  softWrap: true,
                            maxLines: 1,
                            style: GoogleFonts.ibmPlexSans(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_filled,
                                size: 14,
                                color: Colors.white54,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Just now",
                                style: GoogleFonts.ibmPlexSans(
                                    color: Colors.white54, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
