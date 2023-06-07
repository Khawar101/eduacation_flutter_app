import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'search_filter.dart';

class CategoriesViewModel extends BaseViewModel {
  // List<String> countries = ["Brazil", "Nepal", "India", "China", "USA", "Canada"];
  void openBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const FractionallySizedBox(
            heightFactor: 0.7, child: SearchFilter());
      },
      backgroundColor:
          Colors.transparent, // Set the background color to transparent
      isScrollControlled: true,
    );
  }

///////////////////////////////////Fultring/////////////////////////////////////////

  SfRangeValues values = const SfRangeValues(20.0, 60.0);
  List<String> tags = [];
  List<String> options = [
    '3-8 Hours',
    '8-14 Hours',
    '14-20 Hours',
    '20-24 Hours',
    '24-30 Hours',
  ];
  List<String> tags1 = [];
  List<String> options1 = [
    'Design',
    'Painting',
    'Coding',
    'Music',
    'Visual identity',
    'Mathematics',
    'Science',
  ];
  updateTag1(val) {
    tags1 = val;
    notifyListeners();
  }

  updateValue(val) {
    values = val;
    notifyListeners();
  }

  updateTag(val) {
    tags = val;
    notifyListeners();
  }
}
