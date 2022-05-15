import 'package:equatable/equatable.dart';

abstract class StepFourState extends Equatable {
  const StepFourState();
}

class StepFourInitial extends StepFourState {
  @override
  List<Object> get props => [];
}

class StepFourLoading extends StepFourState {
  @override
  List<Object> get props => [];
}

class StepFourSuccess extends StepFourState {
  @override
  List<Object> get props => [];
}

class StepFourFailure extends StepFourState {
  const StepFourFailure(
      {this.errorEmail,
      this.errorPassword,
      this.errorFullName,
      this.errorCfPassword,
      this.errorBirthday,
      this.errorInfoMe,
      this.errorJob,
      this.errorPhoneNumber,
      this.errorPlace})
      : super();
  final String errorFullName;
  final String errorPassword;
  final String errorCfPassword;
  final String errorBirthday;
  final String errorPhoneNumber;
  final String errorEmail;
  final String errorJob;
  final String errorPlace;
  final String errorInfoMe;

  StepFourFailure copyWith(
      {String errorFullName,
      String errorPassword,
      String errorCfPassword,
      String errorBirthday,
      String errorPhoneNumber,
      String errorEmail,
      String errorJob,
      String errorPlace,
      String errorInfoMe}) {
    return StepFourFailure(
      errorFullName: errorFullName ?? this.errorFullName,
      errorPassword: errorPassword ?? this.errorPassword,
      errorCfPassword: errorCfPassword ?? this.errorCfPassword,
      errorBirthday: errorBirthday ?? this.errorBirthday,
      errorPhoneNumber: errorPhoneNumber ?? this.errorPhoneNumber,
      errorEmail: errorEmail ?? this.errorEmail,
      errorJob: errorJob ?? this.errorJob,
      errorPlace: errorPlace ?? this.errorPlace,
      errorInfoMe: errorInfoMe ?? this.errorInfoMe,
    );
  }

  @override
  List<Object> get props => [
        errorFullName,
        errorPassword,
        errorCfPassword,
        errorBirthday,
        errorPhoneNumber,
        errorEmail,
        errorJob,
        errorPlace,
        errorInfoMe
      ];
}
