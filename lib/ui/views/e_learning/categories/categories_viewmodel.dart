import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_filter.dart';

class CategoriesViewModel extends BaseViewModel {

  // List<String> countries = ["Brazil", "Nepal", "India", "China", "USA", "Canada"];
  void openBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const FractionallySizedBox(
          heightFactor: 0.7,
          child: SearchFilter()
          );
      },
      backgroundColor: Colors.transparent, // Set the background color to transparent
    isScrollControlled: true,
    );
  }

}
