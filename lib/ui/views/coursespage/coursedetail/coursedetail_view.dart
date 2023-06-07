import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coursedetail_viewmodel.dart';

class CoursedetailView extends StackedView<CoursedetailViewModel> {
  const CoursedetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CoursedetailViewModel viewModel,
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
  CoursedetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoursedetailViewModel();
}
