import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'notification_viewmodel.dart';
import 'widget.dart/messages.dart';
import 'widget.dart/notification.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            "Notifications",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                isScrollable: false,
                //  indicatorColor: const Color(0xff3787ff),
                ///     indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.only(bottom: 15),
                unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
                labelColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  insets: const EdgeInsets.symmetric(horizontal: 70.0),
                ),
                tabs: [
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.19),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            const Color(0xff4873a6).withOpacity(0.7),
                      ),
                    ),
                    iconMargin: const EdgeInsets.all(0),
                    child: Text(
                      "messages",
                      style: GoogleFonts.ibmPlexSans(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  Tab(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.25),
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            const Color(0xff4873a6).withOpacity(0.7),
                      ),
                    ),
                    iconMargin: const EdgeInsets.all(0),
                    child: Text(
                      "notifications",
                      style: GoogleFonts.ibmPlexSans(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ],
                //        controller: _tabController,
                //    indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width * 0.06,
                      // right: MediaQuery.of(context).size.width * 0.06,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: const SizedBox(
                    child: TabBarView(
                      //      physics: const NeverScrollableScrollPhysics(),
                      //   controller: _tabController,
                      children: [MessagesWidget(), NotificationWidget()],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
