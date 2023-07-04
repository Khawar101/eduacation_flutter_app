import 'package:education/app/app.router.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import '../../../../../app/app.locator.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../services/Model/CoursesModel.dart';
import '../../../../../services/Model/ratingModel.dart';
import '../../../../../services/rating_service.dart';
import '../../../../../services/subscription_service.dart';
import '../../../../../utils/loading.dart';
import '../../../../widgets/app_utils.dart';

class MarketingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final ratingService = locator<RatingService>();
  final _subscriptionService = locator<SubscriptionService>();
  navigateonBack(BuildContext context) {
    // log('====>not move');
    MediaQuery.of(context).orientation == Orientation.portrait;
    _navigationService.back();
  }

  navigateCourses() {
    // log('====>not move');
    _navigationService.navigateToLessonsView();
  }

  // navigateCoursedetail(courseData) {
  //   _navigationService.navigateToCoursedetailView(courseData: courseData);
  // }

  buyCourse(courseData) {
    _subscriptionService.buyCourse(courseData);
  }

  Widget ratingBuilder(CoursesModel courseData) {
    return StreamBuilder<List<RatingModel>>(
      stream: ratingService.ratingStream(courseData.publishDate),
      builder:
          (BuildContext context, AsyncSnapshot<List<RatingModel>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        if (snapshot.data!.isEmpty) {
          return const Center(child: Text("No rating yet..."));
        }
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              RatingModel data = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(data.profile!),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ButtonText(text: data.name!, color: Colors.black),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  wrapAlignment: WrapAlignment.start,
                                  initialRating: data.rating!,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  onRatingUpdate: (rating) {
                                    //print(rating);
                                  },
                                ),
                                Text(
                                  timeago
                                      .format(data.date!.toDate())
                                      .toString(),
                                  style: GoogleFonts.ibmPlexSans(
                                      fontSize: 12,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ReadMoreText(
                      data.review.toString(),
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
                  ],
                ),
              );
            });
      },
    );
  }
}
