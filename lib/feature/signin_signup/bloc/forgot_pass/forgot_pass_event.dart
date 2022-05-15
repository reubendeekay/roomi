import 'package:equatable/equatable.dart';

abstract class ForgotPassEvent extends Equatable{
  const ForgotPassEvent();
}

class ForgotPassButtonPressed extends ForgotPassEvent{
  const ForgotPassButtonPressed({this.email}) : super();
  final String email;

  @override
  List<Object> get props => [email];
}
