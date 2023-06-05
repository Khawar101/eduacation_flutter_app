import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../dashboard/dashboard.dart';

class ButtomBarViewModel extends BaseViewModel {
  List<Widget> views = [
    const DashboardView(),
    Center(
      child: Text("2"),
    ), // const HomeScreen1(),
    Center(
      child: Text("3"),
    ), // const ChatPageScreen(),
    Center(
      child: Text("4"),
    ), // const StudentProfile(),
    Center(
      child: Text("5"),
    ), // const ProfileScreen(),
  ];

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.indicator;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = const Color(0xFF4873A6).withOpacity(0.7);
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
    const Color(0xFFF4E4CE),
  ];
  ItemPosition(value) {
    selectedItemPosition = value;
    notifyListeners();
  }
}
