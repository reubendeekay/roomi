import 'package:equatable/equatable.dart';

abstract class StepFiveState extends Equatable {
  const StepFiveState();
}

class StepFiveInitial extends StepFiveState {
  @override
  List<Object> get props => [];
}

class StepFiveLoading extends StepFiveState {
  @override
  List<Object> get props => [];
}

class StepFiveSuccess extends StepFiveState {
  @override
  List<Object> get props => [];
}

class StepFiveFailure extends StepFiveState {
  const StepFiveFailure({this.errorCode}) : super();
  final String errorCode;

  StepFiveFailure copyWith({String errorCode}) {
    return StepFiveFailure(errorCode: errorCode ?? this.errorCode);
  }

  @override
  List<Object> get props => [errorCode];
}
