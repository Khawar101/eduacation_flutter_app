import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'categories_viewmodel.dart';

class SearchFilter extends StackedView<CategoriesViewModel> {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CategoriesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  CategoriesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategoriesViewModel();
}
