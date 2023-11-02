import 'package:education/ui/views/drawer/drawer_view.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'lessons_screen_viewmodel.dart';

class LessonsScreenView extends StackedView<LessonsScreenViewModel> {
  const LessonsScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LessonsScreenViewModel viewModel, Widget? child) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.vertical_distribute_sharp,
                  color: Colors.black54,
                  size: 18,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              height: 30,
              width: 110,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff4873a6).withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.language,
                    size: 18,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  const SizedBox(width: 3),
                  CustomText(
                      text: "English",
                      textAlign: TextAlign.center,
                      fontSize: 15,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                      fontWeight: FontWeight.w600),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: viewModel.navigateNotifications,
              child: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: LessonsScreenViewModel.itemsnames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF4873A6).withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Center(
                                child: CustomText(
                              text: LessonsScreenViewModel.itemsnames[index],
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: LessonsScreenViewModel.itemsnames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF4873A6).withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Center(
                                child: CustomText(
                              text: LessonsScreenViewModel.itemsnames[index],
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: viewModel.coursesBuilder())),
          ],
        ),
      ),
    );
  }

  @override
  onViewModelReady(LessonsScreenViewModel viewModel) {
    viewModel.viewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  LessonsScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LessonsScreenViewModel();
}
