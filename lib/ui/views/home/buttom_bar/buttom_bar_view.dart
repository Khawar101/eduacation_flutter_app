import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:stacked/stacked.dart';

import 'buttom_bar_viewmodel.dart';

class ButtomBarView extends StackedView<ButtomBarViewModel> {
  const ButtomBarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ButtomBarViewModel viewModel,
    Widget? child,
  ) {
      return Scaffold(
      body:viewModel. views[viewModel.selectedItemPosition],
      bottomNavigationBar: SnakeNavigationBar.color(
        shadowColor:  const Color(0xFF4873A6).withOpacity(0.7),
        height: 40,
        behaviour: viewModel.snakeBarStyle,
        snakeShape: viewModel.snakeShape,
        shape:viewModel. bottomBarShape,
        padding:viewModel. padding,
       
        ///configuration for SnakeNavigationBar.color
        snakeViewColor: viewModel.selectedColor,
        selectedItemColor:
           viewModel. snakeShape == SnakeShape.indicator ? viewModel.selectedColor : null,
        unselectedItemColor:viewModel. unselectedColor,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels:viewModel. showUnselectedLabels,
        showSelectedLabels:viewModel. showSelectedLabels,

        currentIndex:viewModel.selectedItemPosition,
        onTap: (index) => viewModel. ItemPosition(index),
        items:  const[
           
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Activity'),
        BottomNavigationBarItem(icon: Icon(Icons.play_lesson_outlined,size: 20,), label: 'Lessons'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined,size: 20,), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.groups_2_outlined,size: 30,), label: 'Student'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Person')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
      
    );
 
  }

  @override
  ButtomBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ButtomBarViewModel();
}
