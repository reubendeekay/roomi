import 'package:equatable/equatable.dart';

abstract class ResetPassState extends Equatable {
  const ResetPassState();
}

class ResetPassInitial extends ResetPassState {
  @override
  List<Object> get props => [];
}

class ResetPassLoading extends ResetPassState {
  @override
  List<Object> get props => [];
}

class ResetPassSuccess extends ResetPassState {
  @override
  List<Object> get props => [];
}

class ResetPassFailure extends ResetPassState {
  const ResetPassFailure(
      {this.errorCode, this.errorPassword, this.errorCfPassword})
      : super();
  final String errorCode;
  final String errorPassword;
  final String errorCfPassword;

  ResetPassFailure copyWith(
      {String errorCode, String errorPassword, String errorCfPassword}) {
    return ResetPassFailure(
        errorCode: errorCode ?? this.errorCode,
        errorPassword: errorPassword ?? this.errorPassword,
        errorCfPassword: errorCfPassword ?? this.errorCfPassword);
  }

  @override
  List<Object> get props => [errorCode, errorPassword, errorCfPassword];
}
