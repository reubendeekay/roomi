import 'package:equatable/equatable.dart';
import '../../model/option_model.dart';

abstract class ListOptionState extends Equatable {
  const ListOptionState();
}

class ItemSelectedInitial extends ListOptionState {
  @override
  List<Object> get props => [];
}

class ItemSelectedLoading extends ListOptionState {
  @override
  List<Object> get props => [];
}

class ItemSelectedState extends ListOptionState {
  const ItemSelectedState({this.listSelected});
  final List<OptionModel> listSelected;
  @override
  List<Object> get props => [listSelected];
}

class ItemSelectedFailure extends ListOptionState {
  const ItemSelectedFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
