import 'package:equatable/equatable.dart';

abstract class ResetPassEvent extends Equatable {
  const ResetPassEvent();
}

class ResetPassButtonPressed extends ResetPassEvent {
  const ResetPassButtonPressed({this.code, this.password, this.cfPassword})
      : super();
  final String code;
  final String password;
  final String cfPassword;
  @override
  List<Object> get props => [code, password, cfPassword];
}
