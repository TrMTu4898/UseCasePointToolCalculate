import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../data/repositories/person_repository.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/button/button_create_account.dart';
import '../../widgets/button/text_button_signin.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;

  const RegisterScreen({Key? key, required this.authenticationBloc})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureTextPassWord = true;
  bool _obscureTextConfirmPassWord = true;
  bool _checked = false;
  final PersonRepository personRepository = PersonRepository();
  late final signUpFormBloc ;

  @override
  void initState() {
    super.initState();
    signUpFormBloc = SignUpFormBloc(authenticationBloc: widget.authenticationBloc);
  }
  @override
  void dispose() {
    signUpFormBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xff50C2C9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AutoRouter.of(context).pop(true);
          },
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: FormBlocListener<SignUpFormBloc, String, String>(
        formBloc: signUpFormBloc,
        onSubmitting: (context, state) {
        },
        onSuccess: (context, state) {
          print(state);
          final signupState = widget.authenticationBloc.state;
          print(signupState);
          if (signupState is SignUpStateSuccess) {
            print(signupState);
            print(signupState.currentUser);
          } else if(signupState is SignUpStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account creation failed123')),
            );
          }
        },
        onFailure: (context, state) {
          final errorMessage = state.failureResponse ?? 'Account creation failed';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
            ),
          );
        },
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 17, right: 17),
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Signup1.png',
                    width: 246,
                    height: 243,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    child: TextFieldBlocBuilder(
                      textFieldBloc: signUpFormBloc.fullName,
                      keyboardType: TextInputType.name,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Full Name',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff50C2C9),
                        ),
                        fillColor: const Color.fromARGB(255, 250, 252, 255),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    child: TextFieldBlocBuilder(
                      textFieldBloc: signUpFormBloc.email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xff50C2C9),
                        ),
                        fillColor: const Color.fromARGB(255, 250, 252, 255),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff50C2C9),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    child: TextFieldBlocBuilder(
                      textFieldBloc: signUpFormBloc.password,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) => setState(() {}),
                      obscureText: _obscureTextPassWord,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Color(0xff50C2C9),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureTextPassWord = !_obscureTextPassWord;
                            });
                          },
                          child: Icon(
                            _obscureTextPassWord
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff50C2C9),
                          ),
                        ),
                        fillColor: const Color.fromARGB(255, 250, 252, 255),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff50C2C9),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    child: TextFieldBlocBuilder(
                      textFieldBloc: signUpFormBloc.confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) => setState(() {}),
                      obscureText: _obscureTextConfirmPassWord,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Confirm password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xff50C2C9),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureTextConfirmPassWord =
                              !_obscureTextConfirmPassWord;
                            });
                          },
                          child: Icon(
                            _obscureTextConfirmPassWord
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff50C2C9),
                          ),
                        ),
                        fillColor: const Color.fromARGB(255, 250, 252, 255),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff50C2C9),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _checked,
                        onChanged: (bool? value) {
                          setState(() {
                            _checked = value!;
                          });
                        },
                        focusColor: const Color(0xff50C2C9),
                        activeColor: const Color(0xff50C2C9),
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _checked = !_checked;
                          });
                        },
                        child: const Text(
                          'I agree to the terms',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CreateAccountButton(
                  onPressed: signUpFormBloc.submit,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButtonSignIn(
                  onTap: () {
                    context.pushRoute(
                      LogInRoute(
                        authenticationBloc: widget.authenticationBloc,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
