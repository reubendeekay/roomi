import 'package:equatable/equatable.dart';

abstract class ForgotPassState extends Equatable {
  const ForgotPassState();
}

class ForgotPassInitial extends ForgotPassState {
  @override
  List<Object> get props => [];
}

class ForgotPassLoading extends ForgotPassState {

  @override
  List<Object> get props => [];
}

class ForgotPassSuccess extends ForgotPassState {
  @override
  List<Object> get props => [];
}

class ForgotPassFailure extends ForgotPassState {
  const ForgotPassFailure({this.errorEmail}) : super();
  final String errorEmail;

  ForgotPassFailure copyWith({String errorEmail}) {
    return ForgotPassFailure(errorEmail: errorEmail ?? this.errorEmail);
  }

  @override
  List<Object> get props => [errorEmail];
}
