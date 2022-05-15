import 'package:equatable/equatable.dart';
import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';

abstract class ChooseItemState extends Equatable {
  const ChooseItemState();
}

class ChooseItemInitial extends ChooseItemState {
  @override
  List<Object> get props => [];
}

class ChooseItemLoading extends ChooseItemState {
  @override
  List<Object> get props => [];
}

class ChooseItemSuccess extends ChooseItemState {
  const ChooseItemSuccess({this.listOption});
  final List<OptionModel> listOption;
  @override
  List<Object> get props => [listOption];
}

class ChooseItemFailure extends ChooseItemState {
  const ChooseItemFailure({this.error});
  final String error;
  @override
  List<Object> get props => [];
}
