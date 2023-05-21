import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../bloc/authentication/authentication_bloc.dart';
import '../../data/repositories/person_repository.dart';
import '../../router/auto_router.gr.dart';
import '../home_view_screen.dart';
import '../../untillize/auth_validator.dart';
import 'package:usecasepointstool/widgets/button/button_signin_with.dart';
import 'package:usecasepointstool/widgets/button/button_forgot_password.dart';
import 'package:usecasepointstool/widgets/button/button_signin.dart';
import 'package:usecasepointstool/widgets/button/button_signup.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  const LogInScreen({super.key, required this.authenticationBloc});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

bool isAuthentication = false;
class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController(text: "");
  final _passWordController = TextEditingController(text: "");


  String? _email;
  String? _passWord;
  bool _obscureText = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    super.dispose();
  }


  Future<void> login(BuildContext context) async {
    EasyLoading.show(status: 'Is Login');
    // code is here
    String? email = _emailController?.text;
    String? passWord = _passWordController?.text;
    String? validateEmail = Validator.validateEmail(email: email);
    String? validatePassWord = Validator.validatePassword(password: passWord);

    if (validateEmail != null && validatePassWord != null) {
      EasyLoading.showError('You entered the wrong Email or Password');
      return;
    } else if (validateEmail != null) {
      EasyLoading.showError(validateEmail);
      return;
    } else if (validatePassWord != null) {
      EasyLoading.showError(validatePassWord);
      return;
    }else{
      isAuthentication = true;
      widget.authenticationBloc.add(
          LogInRequested(
              email:_email.toString() ,
              password:_passWord.toString()
          ));
      context.pushRoute(const HomeViewRoute());
      setState(() {
        selectedIndex=0;
      });
    }
    // code is here
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return BlocProvider(
      create: (context) => widget.authenticationBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff50C2C9),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pushRoute(const HomeRoute());
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          title: const Text(
            'SIGN IN',
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
        backgroundColor: const Color(0xFFEEEEEE),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 17, right: 17),
          child: ListView(
            children: [
              Column(children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.only(top: 40, bottom: 30),
                //   child: Container(
                //     child: Center(
                //         child: Text(
                //       'SIGN IN',
                //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                //     )),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    child:  Image.asset(
                      'assets/images/SignInfinal1.png',
                      width: 246,
                      height: 243,
                    ),
                  ),
                ),
                // --------------------------UserName----------------------
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5),
                    //     border: Border.all(color: Colors.red)),

                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => setState(() {
                        _email = value;
                      }),
                      validator: (value) => Validator.validateEmail(email: value),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Email ',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff50C2C9),
                        ),
                        fillColor: const Color.fromARGB(255, 250, 252, 255),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff50C2C9),
                            width: 2,
                          ),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      ),
                    ),
                  ),
                ),
                // --------------------------PassWord----------------------
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: Container(
                    child: TextFormField(
                      // validator: (value) =>_validator ,
                      controller: _passWordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          Validator.validatePassword(password: value),
                      onChanged: (value) => setState(() {
                        _passWord = value;
                      }),
                      obscureText: _obscureText,
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
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xff50C2C9),
                          ),
                        ),
                        fillColor: const Color.fromARGB(255, 250, 252, 255),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff50C2C9),
                            width: 2,
                          ),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      ),
                    ),
                  ),
                ),
                // --------------------------Login----------------------
                BlocBuilder<AuthenticationBloc,AuthenticationState>(
                  bloc: widget.authenticationBloc,
                  builder: (context, state){
                    if(state is AuthenticationLoading){
                      return const CircularProgressIndicator();
                    }else if( state is AuthenticationUnauthenticated){
                      Fluttertoast.showToast(
                          msg: "Login unsuccessful!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } return SignInButton(
                      onPressed: () {
                        login(context);

                      },
                    );
                  },

                ),


                // --------------------------Forgot passWord----------------------
                const SizedBox(
                  height: 15,
                ),

                // --------------------------Login With PassWord----------------------
                SignInWithButton(
                  typeSignIn: 'Google',
                  imagePath:'assets/images/google.png',
                  onPressed: (){
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                // --------------------------LoginWith FaceBook----------------------
                SignInWithButton(
                    typeSignIn: 'Facebook',
                    imagePath: 'assets/images/facebook.png',
                    onPressed: () {}
                ),
                const SizedBox(
                  height: 8,
                ),
                SignUpButton(
                  onPressed: () {
                    context.pushRoute( RegisterRoute(authenticationBloc: widget.authenticationBloc));
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                ForgotPasswordButton(onPressed: () {
                  context.pushRoute(const ForgotPasswordRoute());
                }),
                const SizedBox(
                  height: 8,
                ),
              ]),
            ],
          )
        ),
      ),
    );
  }
}
