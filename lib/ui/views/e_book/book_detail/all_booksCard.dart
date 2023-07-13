import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../e_book_viewmodel.dart';

class AllEBooks extends StackedView<EBookViewModel> {
  const AllEBooks({super.key});

  @override
  EBookViewModel viewModelBuilder(BuildContext context) => EBookViewModel();

  @override
  Widget builder(
      BuildContext context, EBookViewModel viewModel, Widget? child) {
    return GestureDetector(
      onTap: viewModel.navigateBookDetail,
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
              child: Image.asset(
                'assets/images/images.jpg',
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
