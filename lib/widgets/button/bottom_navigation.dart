import 'package:flutter/material.dart';

class MyBottomNavigationBarItem extends BottomNavigationBarItem {
  MyBottomNavigationBarItem({
    required String label,
    required Widget icon,
  }) : super(
    label: label,
    icon: icon,
  );
}
