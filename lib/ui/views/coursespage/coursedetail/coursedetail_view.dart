import 'package:education/ui/views/coursespage/coursedetail/detailpagewidgets/detailwidget.dart';
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
      body: const DetailWidget(),
    );
  }

  @override
  CoursedetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoursedetailViewModel();
}
