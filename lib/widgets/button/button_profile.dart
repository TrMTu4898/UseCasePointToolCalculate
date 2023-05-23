import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget{
  final String title;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color textColor;
  const ButtonProfile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
});
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(150, 40),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}