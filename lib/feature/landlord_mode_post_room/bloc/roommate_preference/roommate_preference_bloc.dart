import 'package:flutter_bloc/flutter_bloc.dart';

import 'roommate_preference_event.dart';
import 'roommate_preference_state.dart';

class RoommatePrfBloc extends Bloc<RoommatePrfEvent, RoommatePrfState> {
  RoommatePrfBloc() : super(RoommatePrfInitial());

  @override
  Stream<RoommatePrfState> mapEventToState(RoommatePrfEvent event) async* {
    if (event is NextButtonPressed) {
      try {
          yield RoommatePrfLoading();
        if (_rentError(event.rent) == null &&
            _depositError(event.deposit) == null &&
            _availableError(event.available) == null) {
          yield RoommatePrfSuccess();
        }
        if (_rentError(event.rent) != null ||
            _depositError(event.deposit) != null ||
            _availableError(event.available) != null) {
          yield RoommatePrfFailure(
              errorRent: _rentError(event.rent),
              errorDeposit: _depositError(event.deposit),
              errorAvailable: _availableError(event.available));
        }
      } catch (error) {
        yield RoommatePrfFailure(
            errorRent: _rentError(event.rent),
            errorDeposit: _depositError(event.deposit),
            errorAvailable: _availableError(event.available));
      }
    }
  }

  String _rentError(String rent) {
    if (rent.isEmpty) {
      return "Rent per month can't empty";
    } else {
      return null;
    }
  }

  String _depositError(String deposit) {
    if (deposit.isEmpty) {
      return "Deposit can't empty";
    } else {
      return null;
    }
  }

  String _availableError(String available) {
    if (available.isEmpty) {
      return "Available from can't empty";
    } else {
      return null;
    }
  }
}
