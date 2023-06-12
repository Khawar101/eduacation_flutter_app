import 'package:education/services/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

class SettingViewModel extends BaseViewModel {
    final settingService = locator<SettingService>();

  bool light0 = true;
  bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.check,
        );
      }
      return const Icon(Icons.close);
    },
  );
  upadtelight0(value) {
    light0 = value;
    notifyListeners();
  }

  upadtelight1(value) {
    light1 = value;
    notifyListeners();
  }
  
}
