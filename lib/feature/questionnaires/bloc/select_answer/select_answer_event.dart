import 'package:equatable/equatable.dart';
import 'package:roomy/feature/questionnaires/model/answer_model.dart';

abstract class SelectAnswerEvent extends Equatable {
  const SelectAnswerEvent();
}

class ItemAnswerSelected extends SelectAnswerEvent {
  const ItemAnswerSelected({this.answerModel, this.indexItemSelected})
      : super();
  final List<AnswerModel> answerModel;
  final int indexItemSelected;
  @override
  List<Object> get props => [answerModel, indexItemSelected];
}
