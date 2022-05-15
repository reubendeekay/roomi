import 'package:equatable/equatable.dart';
import '../../model/option_model.dart';

abstract class ListOptionEvent extends Equatable {
  const ListOptionEvent();
}

class ItemSelectedEvent extends ListOptionEvent {
  const ItemSelectedEvent(
      {this.listOption, this.listSelected, this.indexItemSelected})
      : super();
  final List<OptionModel> listOption;
  final List<OptionModel> listSelected;
  final int indexItemSelected;
  @override
  List<Object> get props => [listOption, listSelected, indexItemSelected];
}
