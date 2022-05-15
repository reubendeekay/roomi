import 'package:equatable/equatable.dart';
import 'package:roomy/feature/questionnaires/model/answer_model.dart';

abstract class SelectAnswerState extends Equatable {
  const SelectAnswerState();
}

class SelectAnswerInitial extends SelectAnswerState {
  @override
  List<Object> get props => [];
}

class SelectAnswerLoading extends SelectAnswerState {
  @override
  List<Object> get props => [];
}

class SelectAnswerSelectedState extends SelectAnswerState {
  const SelectAnswerSelectedState({this.answerModel});
  final List<AnswerModel> answerModel;
  @override
  List<Object> get props => [answerModel];
}

class SelectAnswerFailure extends SelectAnswerState {
  const SelectAnswerFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
