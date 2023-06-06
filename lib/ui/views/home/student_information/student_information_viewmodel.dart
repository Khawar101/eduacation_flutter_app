import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentInformationViewModel extends BaseViewModel {
  late TabController tabController;

  // ignore: unused_field
  int currentIndex = 0;

  void tabSelect() {
    log("Tab index is ${tabController.index}");
    currentIndex = tabController.index;
    notifyListeners();
  }
  // @override
  // void initState() {
  //   tabController = TabController(vsync: this, length: 3);
  //   tabController.addListener(tabSelect);

  // super.initState();
//  }
}
