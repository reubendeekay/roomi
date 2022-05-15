import 'package:equatable/equatable.dart';

abstract class RoommatePrfState extends Equatable {
  const RoommatePrfState();
}

class RoommatePrfInitial extends RoommatePrfState {
  @override
  List<Object> get props => [];
}

class RoommatePrfLoading extends RoommatePrfState {
  @override
  List<Object> get props => [];
}

class RoommatePrfSuccess extends RoommatePrfState {
  @override
  List<Object> get props => [];
}

class RoommatePrfFailure extends RoommatePrfState {
  const RoommatePrfFailure(
      {this.errorRent, this.errorDeposit, this.errorAvailable})
      : super();
  final String errorRent;
  final String errorDeposit;
  final String errorAvailable;

  RoommatePrfFailure copyWith(
      {String errorRent, String errorDeposit, String errorAvailable}) {
    return RoommatePrfFailure(
        errorRent: errorRent ?? this.errorRent,
        errorDeposit: errorDeposit ?? this.errorDeposit,
        errorAvailable: errorAvailable ?? this.errorAvailable);
  }

  @override
  List<Object> get props => [errorRent, errorDeposit, errorAvailable];
}
