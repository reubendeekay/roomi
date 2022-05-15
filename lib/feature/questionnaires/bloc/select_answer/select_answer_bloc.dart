import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_select_answer.dart';

class SelectAnswerBloc extends Bloc<SelectAnswerEvent, SelectAnswerState> {
  SelectAnswerBloc() : super(SelectAnswerInitial());

  @override
  Stream<SelectAnswerState> mapEventToState(SelectAnswerEvent event) async* {
    if (event is ItemAnswerSelected) {
      try {
        yield SelectAnswerLoading();
        for (int i = 0; i < event.answerModel.length; i++) {
          if (i == event.indexItemSelected) {
            event.answerModel[i].isSelected = true;
          } else {
            event.answerModel[i].isSelected = false;
          }
        }
        yield SelectAnswerSelectedState(answerModel: event.answerModel);
      } catch (error) {
        yield SelectAnswerFailure(error: error.toString());
      }
    }
  }
}
