import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'booking_viewmodel.dart';

class BookingView extends StackedView<BookingViewModel> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BookingViewModel viewModel,
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
  BookingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookingViewModel();
}
