import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget{
  final void Function() onPressed;
  const CreateAccountButton({
    super.key,
    required this.onPressed
});
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 18)),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xff50C2C9)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          minimumSize:
          MaterialStateProperty.all<Size>(const Size(328, 48)),
        ),
        onPressed: onPressed,
        child: const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}