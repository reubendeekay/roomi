import 'package:equatable/equatable.dart';
import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';

abstract class ChooseItemEvent extends Equatable {
  const ChooseItemEvent();
}

class ItemSelectedEvent extends ChooseItemEvent {
  const ItemSelectedEvent({this.indexSelected, this.listOption});
  final int indexSelected;
  final List<OptionModel> listOption;
  @override
  List<Object> get props => [indexSelected, listOption];
}
