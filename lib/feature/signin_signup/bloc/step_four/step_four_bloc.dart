import 'package:flutter_bloc/flutter_bloc.dart';

import 'step_four_event.dart';
import 'step_four_state.dart';

class StepFourBloc extends Bloc<StepFourEvent, StepFourState> {
  StepFourBloc() : super(StepFourInitial());

  @override
  Stream<StepFourState> mapEventToState(StepFourEvent event) async* {
    if (event is StepFourButtonPressed) {
      try {
         yield StepFourLoading();
        if (_fullNameError(event.name) == null &&
            _birthdayError(event.birthday) == null &&
            _phoneError(event.phone) == null &&
            _emailError(event.email) == null &&
            _passwordError(event.password) == null &&
            _cfPasswordError(event.cfPassword, event.password) == null &&
            _jobError(event.job) == null &&
            _placeError(event.place) == null &&
            _infoMeError(event.infoMe) == null) {
          yield StepFourSuccess();
        }
        if (_fullNameError(event.name) != null ||
            _birthdayError(event.birthday) != null ||
            _phoneError(event.phone) != null ||
            _emailError(event.email) != null ||
            _passwordError(event.password) != null ||
            _cfPasswordError(event.cfPassword, event.password) != null ||
            _jobError(event.job) != null ||
            _placeError(event.place) != null ||
            _infoMeError(event.infoMe) != null) {
          yield StepFourFailure(
              errorFullName: _fullNameError(event.name),
              errorBirthday: _birthdayError(event.birthday),
              errorPhoneNumber: _phoneError(event.phone),
              errorEmail: _emailError(event.email),
              errorPassword: _passwordError(event.password),
              errorCfPassword:
                  _cfPasswordError(event.cfPassword, event.password),
              errorJob: _jobError(event.job),
              errorPlace: _placeError(event.place),
              errorInfoMe: _infoMeError(event.infoMe));
        }
      } catch (error) {
        yield StepFourFailure(
            errorFullName: error.toString(),
            errorBirthday: error.toString(),
            errorPhoneNumber: error.toString(),
            errorEmail: error.toString(),
            errorPassword: error.toString(),
            errorCfPassword: error.toString(),
            errorJob: error.toString(),
            errorPlace: error.toString(),
            errorInfoMe: error.toString());
      }
    }
  }

  String _fullNameError(String fullName) {
    if (fullName.isEmpty) {
      return "Your full name can't empty";
    } else {
      return null;
    }
  }

  String _birthdayError(String birthday) {
    if (birthday.isEmpty) {
      return "Your birthday can't empty";
    } else {
      return null;
    }
  }

  String _phoneError(String phone) {
    if (phone.isEmpty) {
      return "Your phone can't empty";
    } else if (!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(phone)) {
      return 'Enter valid phone number';
    } else {
      return null;
    }
  }

  String _emailError(String email) {
    if (email.isEmpty) {
      return "Your email can't empty";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Email must have a format: "Example@gmail.com"';
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

  String _jobError(String job) {
    if (job.isEmpty) {
      return "Your job can't empty";
    } else {
      return null;
    }
  }

  String _placeError(String place) {
    if (place.isEmpty) {
      return "Your workplace can't empty";
    } else {
      return null;
    }
  }

  String _infoMeError(String infoMe) {
    if (infoMe.isEmpty) {
      return "Your information can't empty";
    } else {
      return null;
    }
  }
}
