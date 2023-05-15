import 'package:flutter/material.dart';

class MyBottomNavigationBarItem extends BottomNavigationBarItem {
  MyBottomNavigationBarItem({
    required String label,
    required Widget icon,
    required Color selectedColor,
    required Color unselectedColor,
    required bool isSelected,
  }) : super(
    label: label,
    icon: Container(
      decoration: BoxDecoration(
        color: isSelected  ? selectedColor : unselectedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
    ),
  );
}
