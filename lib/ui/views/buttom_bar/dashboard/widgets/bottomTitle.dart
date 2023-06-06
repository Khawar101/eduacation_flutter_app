import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('8AM', style: style);
      break;
    case 4:
      text = const Text('9AM', style: style);
      break;
    case 6:
      text = const Text('10AM', style: style);
      break;
    case 8:
      text = const Text('11AM', style: style);
      break;
    case 10:
      text = const Text('12PM', style: style);
      break;
    case 12:
      text = const Text('01PM', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8,
    child: text,
  );
}
