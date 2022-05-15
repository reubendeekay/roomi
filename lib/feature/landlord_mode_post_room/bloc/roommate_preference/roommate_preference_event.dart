import 'package:equatable/equatable.dart';

abstract class RoommatePrfEvent extends Equatable {
  const RoommatePrfEvent();
}

class NextButtonPressed extends RoommatePrfEvent {
  const NextButtonPressed({this.rent, this.deposit,this.available}) : super();
  final String rent;
  final String deposit;
  final String available;
  @override
  List<Object> get props => [rent, deposit,available];

}
