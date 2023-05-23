import 'package:flutter/material.dart';

class TextButtonSignIn extends StatelessWidget{
  final void Function() onTap;
  const TextButtonSignIn({
    super.key,
    required this.onTap,
});
  @override
  Widget build (BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap:onTap,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'You are have account?',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff50C2C9)),
              )
            ]),
      ),
    );
  }
}