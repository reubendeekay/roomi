import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_option_event.dart';
import 'list_option_state.dart';

class ListOptionBloc extends Bloc<ListOptionEvent, ListOptionState> {
  ListOptionBloc() : super(ItemSelectedInitial());

  @override
  Stream<ListOptionState> mapEventToState(ListOptionEvent event) async* {
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
        print(event.listSelected.length);
        yield ItemSelectedState(listSelected: event.listSelected);
      } catch (error) {
        yield ItemSelectedFailure(error: error.toString());
      }
    }
  }
}
