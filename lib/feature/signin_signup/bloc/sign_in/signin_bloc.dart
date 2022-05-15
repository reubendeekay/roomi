import 'package:flutter_bloc/flutter_bloc.dart';

import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressed) {
      try {
          yield SignInLoading();
        if (_emailError(event.email) == null &&
            _passwordError(event.password) == null) {
          yield SignInSuccess();
        }
        if (_emailError(event.email) != null ||
            _passwordError(event.password) != null) {
          yield SignInFailure(
              errorEmail: _emailError(event.email),
              errorPassword: _passwordError(event.password));
        }
      } catch (error) {
        yield SignInFailure(
            errorEmail: error.toString(), errorPassword: error.toString());
      }
    }
  }

  String _emailError(String email) {
    if (email.isEmpty) {
      return "Email can't empty";
    } else {
      return null;
    }
  }

  String _passwordError(String pass) {
    if (pass.isEmpty) {
      return "Password can't empty";
    } else {
      return null;
    }
  }

  // String _passwordError(String pass) {
  //   int count = 0;
  //   if (pass.length > 8 && pass.length < 20) {
  //     count++;
  //     // return 'Password must be less than 20 and more than 8 characters in length';
  //   }
  //   if (RegExp('(.*[A-Z].*)').hasMatch(pass)) {
  //     count++;
  //     //  return 'Password must have at least one uppercase character';
  //   }
  //   if (RegExp('(.*[a-z].*)').hasMatch(pass)) {
  //     count++;
  //     //  return 'Password must have at least one lowercase character';
  //   }
  //   if (RegExp('(.*[0-9].*)').hasMatch(pass)) {
  //     count++;
  //     //  return 'Password must have at least one number';
  //   }
  //   if (RegExp('(.*[@,#,\$,%].*\$)').hasMatch(pass)) {
  //     count++;
  //   }
  //   if (count == 0) {
  //     return 'Password can not be empty';
  //   } else if (count == 1) {
  //     return 'Password is too weak';
  //   } else if (count == 2) {
  //     return 'Password is weak';
  //   } else if (count == 3) {
  //     return 'Password is medium';
  //   } else if (count == 4) {
  //     return 'Password is strong';
  //   }
  // }
}
