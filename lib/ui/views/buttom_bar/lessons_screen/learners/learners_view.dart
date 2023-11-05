import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'learners_viewmodel.dart';

class LearnersView extends StackedView<LearnersViewModel> {
  const LearnersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LearnersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: viewModel.navigateonBack,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
              size: 18,
            ),
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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.share_outlined,
                color: Colors.black54,
                size: 20,
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                  child: BigText(
                      text: 'Here is what learners are saying',
                      color: Colors.black)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // width: 100,
                          decoration: BoxDecoration(
                              color: const Color(0xFF4873A6).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.025),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 18,
                                  ignoreGestures: true,
                                  itemPadding: const EdgeInsets.only(right: 6),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  onRatingUpdate: (rating) {
                                    // print(rating);
                                  },
                                ),
                                const SizedBox(height: 8),
                                CustomText(
                                    text: 'Best Course and benefits',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                                const Spacer(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 16,
                                      backgroundImage: AssetImage(
                                          'assets/images/download (1).jpeg'),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: 'Rakibull hassan',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                        CustomText(
                                            text: '2 hours ago',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Center(
                child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF4873A6).withOpacity(0.7),
                    ),
                    child: const Center(
                        child: ButtonText(
                            text: 'See all Lessons', color: Colors.white))),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => const HomeScreen4())));
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF4873A6).withOpacity(0.7),
                  ),
                  child: const Center(
                      child: ButtonText(
                          text: 'Unlock All Videos', color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LearnersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LearnersViewModel();
}
