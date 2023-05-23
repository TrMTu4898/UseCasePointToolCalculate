part of '../authentication_bloc.dart';

class SignUpFormBloc extends FormBloc<String, String> {
  final AuthenticationBloc authenticationBloc;
  final TextFieldBloc fullName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final TextFieldBloc email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );
  final TextFieldBloc password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      (value) {
        if (value.length < 6) {
          return 'Password must contain at least 6 characters';
        }
        return null;
      },
    ],
  );
  final TextFieldBloc confirmPassword = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  SignUpFormBloc({required this.authenticationBloc}) {
    addFieldBlocs(fieldBlocs: [
      fullName,
      email,
      password,
      confirmPassword,
    ]);
  }

  @override
  void onSubmitting() async {
    fullName.validate();
    email.validate();
    password.validate();
    confirmPassword.validate();

    if (password.value != confirmPassword.value) {
      confirmPassword.addFieldError('Confirm password does not match');
      emitFailure();
      return;
    } else {
      authenticationBloc.add(SignUpEvent(
          confirmPassword: confirmPassword.value,
          password: password.value,
          email: email.value,
          fullName: fullName.value));
    }
    emitSuccess(canSubmitAgain: true);
  }

  void onSuccess() {}
}
