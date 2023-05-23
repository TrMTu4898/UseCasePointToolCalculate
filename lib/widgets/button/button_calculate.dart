
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final void Function() onPressed;
  const CalculateButton({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF50C2C9),
        //minimumSize: const Size(350, 60),
        padding: const EdgeInsets.symmetric(horizontal: 120,vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Text(
        'Calculate',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}