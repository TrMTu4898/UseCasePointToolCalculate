import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class WidgetTextFieldBloc extends StatelessWidget{
  final TextFieldBloc textFieldBloc;
  final FocusNode? focusNode;
  final String hintText;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final Widget ? prefixIcon;
  final TextInputAction? textInputAction;
  const WidgetTextFieldBloc({
    Key?key,
    required this.textFieldBloc,
    required this.focusNode,
    required this.onChange,
    required this.hintText,
    required this.keyboardType,
    required this.onSubmitted,
    required this.prefixIcon,
    required this.textInputAction,
}): super(key:key);

  @override
  Widget build(BuildContext context){
    return TextFieldBlocBuilder(
      focusNode: focusNode ,
      textFieldBloc: textFieldBloc,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        border:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: const Color.fromARGB(255, 250, 252, 255),
        contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
      ),
      textInputAction: textInputAction,
      onChanged: onChange,
      onSubmitted: onSubmitted,
    );
  }

}