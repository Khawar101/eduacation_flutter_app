import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/Model/EbookModel.dart';
import '../../../../services/ebook_service.dart';
import '../../../../utils/loading.dart';
import '../e_book_viewmodel.dart';

final eBookService = locator<EbookService>();

class TrendingNew extends StackedView<EBookViewModel> {
  const TrendingNew({super.key});

  @override
  EBookViewModel viewModelBuilder(BuildContext context) => EBookViewModel();

  @override
  Widget builder(
      BuildContext context, EBookViewModel viewModel, Widget? child) {
    return StreamBuilder<List<EbookModel>>(
      stream: eBookService.eBookStream(),
      builder:
          (BuildContext context, AsyncSnapshot<List<EbookModel>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading(100);
        }
        return Container(
          height: 200,
          child: ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  viewModel.navigateBookDetail(data);
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              data.coverPic.toString(),
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title!,
                                style: GoogleFonts.ibmPlexSans(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                data.publisherData!.name!,
                                style: GoogleFonts.ibmPlexSans(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              RatingBar.builder(
                                wrapAlignment: WrapAlignment.start,
                                initialRating: data.rating!,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                ignoreGestures: true,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                onRatingUpdate: (rating) {
                                  //print(rating);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
