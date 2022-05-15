import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInButtonPressed extends SignInEvent {
  const SignInButtonPressed({this.password, this.email}) : super();
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password }';
}

// class FieldValidationEvent extends SignInEvent {
//   FieldValidationEvent({
//     this.text,
//     this.type,
//   });
//   final String text;
//   final TextFieldType type;
//
//   @override
//   Stream<SignInState> applyAsync(
//       {SignInState currentState, SignInBloc bloc}) async* {
//     try {
//       if (
//           currentState is ErrorLoginState) {
//         if (type == TextFieldType.email) {
//           yield LoginValidatorState(emailError: _emailError(), type: type);
//         } else {
//           yield LoginValidatorState(
//               passwordError: _passwordError(), type: type);
//         }
//         return;
//       }
//       if (currentState is LoginValidatorState) {
//         if (type == TextFieldType.email) {
//           yield LoginValidatorState(
//               emailError: _emailError(),
//               passwordError: currentState.passwordError,
//               text: text);
//         } else {
//           yield LoginValidatorState(
//               passwordError: _passwordError(),
//               emailError: currentState.emailError,
//               text: text);
//         }
//       }
//     } catch (_, stackTrace) {
//       yield ErrorLoginState(stackTrace.toString());
//     }
//   }
//
//   String _emailError() => text.length >= 3 && text.length <= 10
//       ? null
//       : 'Minimum 3 and maximum 10 characters allowed.';
//   String _passwordError() => text.length >= 6 && text.length <= 12
//       ? null
//       : 'Minimum 6 and maximum 12 characters allowed.';
//
//   @override
//   List<Object> get props => [text, type];
// }
