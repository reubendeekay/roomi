import 'dart:core';

class DataState {}

class StateLoading extends DataState {}

class StateError extends DataState {
  StateError(this.message);
  final String message;
}

class StateInitial extends DataState {}

class StateSuccessWithList extends DataState {
  StateSuccessWithList(this.result);
  final List<Object> result;
}

class StateSuccessWithMap extends DataState {
  StateSuccessWithMap(this.result);
  final Map<String, dynamic> result;
}

class StateEmpty extends DataState {}
