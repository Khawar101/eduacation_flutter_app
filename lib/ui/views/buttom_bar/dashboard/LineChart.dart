// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_model.dart';

class LineChartView extends StackedView<DashboardViewModel> {
  const LineChartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff4873a6).withOpacity(0.7),
        ),
        child: LineChart(
          viewModel.isShowingMainData
              ? viewModel.sampleData1
              : viewModel.sampleData2,
          // duration: const Duration(milliseconds: 250),
        ),
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
