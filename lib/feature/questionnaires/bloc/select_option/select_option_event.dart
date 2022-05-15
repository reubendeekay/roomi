import 'package:equatable/equatable.dart';
import '../../model/answer_model.dart';

abstract class SelectOptionEvent extends Equatable {
  const SelectOptionEvent();
}

class ItemSelectedEvent extends SelectOptionEvent {
  const ItemSelectedEvent(
      {this.listOption, this.listSelected, this.indexItemSelected})
      : super();
  final List<AnswerModel> listOption;
  final List<AnswerModel> listSelected;
  final int indexItemSelected;
  @override
  List<Object> get props => [listOption, listSelected, indexItemSelected];
}
