// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white);
  String text;
  switch (value.toInt()) {
    case 1:
      text = '0h0m';
      break;
    case 2:
      text = '0h30m';
      break;
    case 3:
      text = '1h0m';
      break;
    case 4:
      text = '1h30m';
      break;
    case 5:
      text = '2h0m';
      break;
    case 6:
      text = '2h30m';
      break;
    case 7:
      text = '3h0m';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.center);
}
