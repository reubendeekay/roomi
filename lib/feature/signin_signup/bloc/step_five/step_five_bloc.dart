import 'package:flutter_bloc/flutter_bloc.dart';

import 'step_five_event.dart';
import 'step_five_state.dart';

class StepFiveBloc extends Bloc<StepFiveEvent, StepFiveState> {
  StepFiveBloc() : super(StepFiveInitial());

  @override
  Stream<StepFiveState> mapEventToState(StepFiveEvent event) async* {
    if (event is StepFiveButtonPressed) {
      try {
          yield StepFiveLoading();
        if (_codeError(event.codeVerity) == null) {
          yield StepFiveSuccess();
        }
        if (_codeError(event.codeVerity) != null) {
          yield StepFiveFailure(errorCode: _codeError(event.codeVerity));
        }
      } catch (error) {
        yield StepFiveFailure(errorCode: error.toString());
      }
    }
  }

  String _codeError(String code) {
    if (code.isEmpty) {
      return "Verity Code can't empty";
    } else if (code.length < 6) {
      return 'You must enter enough characters';
    }else {
      return null;
    }
  }
}
