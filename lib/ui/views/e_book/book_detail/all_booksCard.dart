import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/Model/EbookModel.dart';
import '../../../../services/ebook_service.dart';
import '../../../../utils/loading.dart';
import '../e_book_viewmodel.dart';

final eBookService = locator<EbookService>();

class AllEBooks extends StackedView<EBookViewModel> {
  const AllEBooks({super.key});

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
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var data = snapshot.data![index];
            return GestureDetector(
              onTap: (){
                viewModel.navigateBookDetail(data);
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      data.coverPic.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
