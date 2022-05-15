import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

// class LoginDefaultState extends SignInState {
//   const LoginDefaultState() : super();
//
//   @override
//   String toString() => 'LoginDefaultState';
// }

// class ErrorLoginState extends SignInState {
//   const ErrorLoginState(this.errorMessage) : super();
//
//   final String errorMessage;
//
//   @override
//   String toString() => 'ErrorLoginState';
// }

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInSuccess extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInFailure extends SignInState {
  const SignInFailure({this.errorEmail, this.errorPassword}) : super();
  final String errorEmail;
  final String errorPassword;

  SignInFailure copyWith({String errorEmail, String errorPassword}) {
    return SignInFailure(
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
    );
  }

  @override
  List<Object> get props => [errorEmail, errorPassword];
}

// class LoginValidatorState extends SignInState {
//   LoginValidatorState(
//       {this.emailError, this.passwordError, this.text = '', this.type})
//       : super(<dynamic>[emailError, passwordError, type, text]);
//   final String emailError;
//   final String passwordError;
//   final String text;
//   final TextFieldType type;
//
//   LoginValidatorState copyWith(
//       {String emailError, String passwordError, String text}) {
//     return LoginValidatorState(
//       emailError: emailError ?? this.emailError,
//       passwordError: passwordError ?? this.passwordError,
//     );
//   }
// }
