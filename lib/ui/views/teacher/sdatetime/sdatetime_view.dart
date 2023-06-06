import 'package:education/ui/views/teacher/sdatetime/select_date_time.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sdatetime_viewmodel.dart';

class SdatetimeView extends StackedView<SdatetimeViewModel> {
  const SdatetimeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SdatetimeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SlectDateTime(),
    );
  }

  @override
  SdatetimeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SdatetimeViewModel();
}
