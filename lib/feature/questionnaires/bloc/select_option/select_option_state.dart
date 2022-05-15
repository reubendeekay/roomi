import 'package:equatable/equatable.dart';
import 'package:roomy/feature/questionnaires/model/answer_model.dart';

abstract class SelectOptionState extends Equatable {
  const SelectOptionState();
}

class ItemSelectedInitial extends SelectOptionState {
  @override
  List<Object> get props => [];
}

class ItemSelectedLoading extends SelectOptionState {
  @override
  List<Object> get props => [];
}

class ItemSelectedState extends SelectOptionState {
  const ItemSelectedState({this.listSelected});
  final List<AnswerModel> listSelected;
  @override
  List<Object> get props => [listSelected];
}

class ItemSelectedFailure extends SelectOptionState {
  const ItemSelectedFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
