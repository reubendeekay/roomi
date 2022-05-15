import 'package:equatable/equatable.dart';

abstract class StepFourEvent extends Equatable {
  const StepFourEvent();
}

class StepFourButtonPressed extends StepFourEvent {
  const StepFourButtonPressed(
      {this.name,
      this.email,
      this.password,
      this.cfPassword,
      this.phone,
      this.birthday,
      this.job,
      this.place,
      this.infoMe})
      : super();
  final String name;
  final String email;
  final String password;
  final String cfPassword;
  final String phone;
  final String birthday;
  final String job;
  final String place;
  final String infoMe;

  @override
  List<Object> get props =>
      [name, email, password, cfPassword, phone, birthday, job, place, infoMe];
}
