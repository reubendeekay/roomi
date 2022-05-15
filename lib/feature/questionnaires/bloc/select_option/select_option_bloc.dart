import 'package:flutter_bloc/flutter_bloc.dart';

import 'select_option_event.dart';
import 'select_option_state.dart';

class SelectOptionBloc extends Bloc<SelectOptionEvent, SelectOptionState> {
  SelectOptionBloc() : super(ItemSelectedInitial());

  @override
  Stream<SelectOptionState> mapEventToState(SelectOptionEvent event) async* {
    if (event is ItemSelectedEvent) {
      try {
        yield ItemSelectedLoading();
        for (int i = 0; i < event.listOption.length; i++) {
          if (i == event.indexItemSelected) {
            if (event.listOption[i].isSelected) {
              event.listOption[i].isSelected = !event.listOption[i].isSelected;
              if (event.listSelected != null) {
                event.listSelected.remove(event.listOption[i]);
              }
            } else {
              event.listOption[i].isSelected = !event.listOption[i].isSelected;
              event.listSelected.add(event.listOption[i]);
            }
          }
        }
        yield ItemSelectedState(listSelected: event.listSelected);
      } catch (error) {
        yield ItemSelectedFailure(error: error.toString());
      }
    }
  }
}
