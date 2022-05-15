import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_choose_item.dart';

class ChooseItemBloc extends Bloc<ChooseItemEvent, ChooseItemState> {
  ChooseItemBloc() : super(ChooseItemInitial());
  @override
  Stream<ChooseItemState> mapEventToState(ChooseItemEvent event) async* {
    if (event is ItemSelectedEvent) {
      try {
        yield ChooseItemLoading();
        for (int i = 0; i < event.listOption.length; i++) {
          if (i == event.indexSelected) {
            event.listOption[i].isSelected = true;
          } else {
            event.listOption[i].isSelected = false;
          }
        }
        yield ChooseItemSuccess(listOption: event.listOption);
      } catch (error) {
        yield ChooseItemFailure(error: error.toString());
      }
    }
  }
}
