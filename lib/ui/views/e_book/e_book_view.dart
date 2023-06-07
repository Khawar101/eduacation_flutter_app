import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'e_book_viewmodel.dart';

class EBookView extends StackedView<EBookViewModel> {
  const EBookView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EBookViewModel viewModel,
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
  EBookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EBookViewModel();
}
