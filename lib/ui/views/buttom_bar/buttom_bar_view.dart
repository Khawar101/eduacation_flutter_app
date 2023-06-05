import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buttom_bar_viewmodel.dart';

class ButtomBarView extends StackedView<ButtomBarViewModel> {
  const ButtomBarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ButtomBarViewModel viewModel,
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
  ButtomBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ButtomBarViewModel();
}
