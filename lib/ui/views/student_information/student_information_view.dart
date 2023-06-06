import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'student_information_viewmodel.dart';

class StudentInformationView extends StackedView<StudentInformationViewModel> {
  const StudentInformationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StudentInformationViewModel viewModel,
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
  StudentInformationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentInformationViewModel();
}
