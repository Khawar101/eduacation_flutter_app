import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'marketing_viewmodel.dart';

class MarketingView extends StackedView<MarketingViewModel> {
  const MarketingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MarketingViewModel viewModel,
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
  MarketingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MarketingViewModel();
}
