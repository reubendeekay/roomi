import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_pass_event.dart';
import 'forgot_pass_state.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc() : super(ForgotPassInitial());

  @override
  Stream<ForgotPassState> mapEventToState(ForgotPassEvent event) async* {
    if (event is ForgotPassButtonPressed) {
      try {
        yield ForgotPassLoading();
        if (_emailError(event.email) == null) {
          yield ForgotPassSuccess();
        }
        if (_emailError(event.email) != null) {
          yield ForgotPassFailure(errorEmail: _emailError(event.email));
        }
      } catch (error) {
        yield ForgotPassFailure(errorEmail: error.toString());
      }
    }
  }

  String _emailError(String email) {
    if (email.isEmpty) {
      return "Email can't empty";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Email must have a format: "Example@gmail.com"';
    } else {
      return null;
    }
  }
}
