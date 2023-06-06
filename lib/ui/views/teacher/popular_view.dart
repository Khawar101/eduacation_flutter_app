import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'popular_viewmodel.dart';

class PopularView extends StackedView<PopularViewModel> {
  const PopularView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PopularViewModel viewModel,
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
  PopularViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PopularViewModel();
}
