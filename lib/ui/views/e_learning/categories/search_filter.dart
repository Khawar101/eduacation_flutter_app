import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
import '../../../widgets/app_utils.dart';
import 'categories_viewmodel.dart';

class SearchFilter extends StackedView<CategoriesViewModel> {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CategoriesViewModel viewModel,
    Widget? child,
  ) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Scaffold(
        backgroundColor: const Color(0xff4873a6).withOpacity(0.7),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff4873a6).withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/icons/multiply-48.png',
                              width: 16)),
                      Expanded(
                        child: Center(
                            child: CustomText(
                                text: 'Search Filter',
                                size: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const ButtonText(text: "Categories", color: Colors.white),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  ChipsChoice<String>.multiple(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    value: viewModel.tags1,
                    // placeholderStyle: TextStyle(fontSize: 4,color: Colors.red),

                    padding: const EdgeInsets.all(0),
                    onChanged: (val) => viewModel.updateTag1(val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: viewModel.options1,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceStyle: const C2ChipStyle(
                      foregroundStyle: TextStyle(fontSize: 10),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      overlayColor: Colors.white,
                      borderColor: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    wrapped: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  const ButtonText(text: "Price", color: Colors.white),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                  SfRangeSlider(
                    min: 0.0,
                    max: 100.0,
                    values: viewModel.values,

                    dividerShape: const SfDividerShape(),
                    interval: 20,

                    showTicks: false,
                    showLabels: true,
                    //   enableTooltip: true,
                    numberFormat: NumberFormat("\$"),
                    activeColor: Colors.white,
                    inactiveColor: Colors.black54,

                    // minorTicksPerInterval: 500,
                    //labelPlacement: LabelPlacement.values,
                    onChanged: (SfRangeValues value) =>
                        viewModel.updateValue(value),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  const ButtonText(text: "Duration", color: Colors.white),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ChipsChoice<String>.multiple(
                    value: viewModel.tags,
                    padding: const EdgeInsets.all(0),
                    onChanged: (val) => viewModel.updateTag(val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: viewModel.options,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceStyle: const C2ChipStyle(
                      foregroundStyle: TextStyle(fontSize: 10),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      overlayColor: Colors.white,
                      borderColor: Colors.white,
                      // iconColor: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    wrapped: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: ButtonText(
                              text: "Clear",
                              color: const Color(0xff4873a6).withOpacity(0.7),
                            ),
                          )),
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: ButtonText(
                              text: "Apply Filter",
                              color: const Color(0xff4873a6).withOpacity(0.7),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  CategoriesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategoriesViewModel();
}
