import 'package:flutter_bloc/flutter_bloc.dart';

import 'reset_pass_event.dart';
import 'reset_pass_state.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  ResetPassBloc() : super(ResetPassInitial());

  @override
  Stream<ResetPassState> mapEventToState(ResetPassEvent event) async* {
    if (event is ResetPassButtonPressed) {
      try {
        yield ResetPassLoading();
        if (_codeError(event.code) == null &&
            _passwordError(event.password) == null &&
            _cfPasswordError(event.cfPassword, event.password) == null) {
          yield ResetPassSuccess();
        }
        if (_codeError(event.code) != null ||
            _passwordError(event.password) != null ||
            _cfPasswordError(event.cfPassword, event.password) != null) {
          yield ResetPassFailure(
              errorCode: _codeError(event.code),
              errorPassword: _passwordError(event.password),
              errorCfPassword:
                  _cfPasswordError(event.cfPassword, event.password));
        }
      } catch (error) {
        yield ResetPassFailure(
            errorCode: error.toString(),
            errorPassword: error.toString(),
            errorCfPassword: error.toString());
      }
    }
  }

  String _codeError(String code) {
    if (code.isEmpty) {
      return "Code can't empty";
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

  String _cfPasswordError(String cfPass, String pass) {
    if (cfPass.isEmpty || cfPass.compareTo(pass) != 0) {
      return 'Confirm Password not match with Password';
    } else {
      return null;
    }
  }
}
