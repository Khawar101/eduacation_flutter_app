// ignore_for_file: non_constant_identifier_names

import 'package:education/ui/views/buttom_bar/lessons_screen/lessons_screen_view.dart';
import 'package:education/ui/views/buttom_bar/student_information/student_information_view.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../buttom_bar/chat/chats/chats_view.dart';
import 'dashboard/dashboard.dart';
import 'profile/profile_view.dart';

class ButtomBarViewModel extends BaseViewModel {
  List<Widget> views = [
    const DashboardView(),
    const LessonsScreenView(), // const HomeScreen1(),
    const ChatsView(),
    const StudentInformationView(), // const StudentProfile(),
    const ProfileView(),
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
