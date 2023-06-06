import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'card_viewmodel.dart';

class CardView extends StackedView<CardViewModel> {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardViewModel viewModel,
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
  CardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewModel();
}
