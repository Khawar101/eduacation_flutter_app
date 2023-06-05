import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'forget_viewmodel.dart';

class ForgetView extends StackedView<ForgetViewModel> {
  const ForgetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetViewModel viewModel,
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
  ForgetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgetViewModel();
}
