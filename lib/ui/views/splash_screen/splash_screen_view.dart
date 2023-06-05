import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StackedView<SplashScreenViewModel> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashScreenViewModel viewModel,
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
  SplashScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashScreenViewModel();
}
