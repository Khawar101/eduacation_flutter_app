// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget Loading() {
  return Center(
    child: LoadingAnimationWidget.threeArchedCircle(
      color: Colors.blueAccent,
      size: 100,
    ),
  );
}
