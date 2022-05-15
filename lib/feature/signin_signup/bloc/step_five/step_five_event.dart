import 'package:equatable/equatable.dart';

abstract class StepFiveEvent extends Equatable {
  const StepFiveEvent();
}

class StepFiveButtonPressed extends StepFiveEvent {
  const StepFiveButtonPressed({this.codeVerity}) : super();
  final String codeVerity;

  @override
  List<Object> get props => [codeVerity];
}
