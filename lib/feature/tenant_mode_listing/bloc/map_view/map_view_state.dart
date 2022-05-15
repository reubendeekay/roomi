import 'package:equatable/equatable.dart';

abstract class MapViewState extends Equatable {
  const MapViewState();
}

class MapViewInitial extends MapViewState {
  @override
  List<Object> get props => [];
}

class MapViewLoading extends MapViewState {
  @override
  List<Object> get props => [];
}

class MapViewSelectedState extends MapViewState {
  const MapViewSelectedState({this.listOfMarker});
  final List<Map<String, dynamic>> listOfMarker;

  MapViewSelectedState copyWith({List<Map<String, dynamic>> listOfMarker}) {
    return MapViewSelectedState(
      listOfMarker: listOfMarker ?? this.listOfMarker,
    );
  }

  @override
  List<Object> get props => [listOfMarker];
}

class MapViewFailure extends MapViewState {
  const MapViewFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
