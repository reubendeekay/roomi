import 'package:equatable/equatable.dart';

abstract class MapViewEvent extends Equatable {
  const MapViewEvent();
}

class SelectedPlaceEvent extends MapViewEvent {
  const SelectedPlaceEvent({this.id, this.selected});
  final int id;
  final bool selected;
  @override
  List<Object> get props => [id, selected];
}
