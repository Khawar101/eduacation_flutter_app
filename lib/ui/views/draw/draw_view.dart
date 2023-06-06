import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'draw_viewmodel.dart';

class DrawView extends StackedView<DrawViewModel> {
  const DrawView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DrawViewModel viewModel,
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
  DrawViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DrawViewModel();
}
