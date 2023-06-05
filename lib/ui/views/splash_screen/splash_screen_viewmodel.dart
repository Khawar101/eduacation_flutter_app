import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'widgets/SplashContainer1.dart';
import 'widgets/SplashContainer2.dart';
import 'widgets/SplashContainer3.dart';
import 'widgets/SplashContainer4.dart';
import 'widgets/SplashContainer5.dart';

class SplashScreenViewModel extends BaseViewModel {
  final List<Widget> items = [
    const SplashContainer1(),
    const SplashContainer2(),
    const SplashContainer3(),
    const SplashContainer4(),
    const SplashContainer5(),
  ];
}
