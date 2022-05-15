import 'package:equatable/equatable.dart';

abstract class LoadMorePostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMorePostFetched extends LoadMorePostEvent {}
