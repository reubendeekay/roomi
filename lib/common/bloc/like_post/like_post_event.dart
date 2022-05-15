import 'package:equatable/equatable.dart';

abstract class LikePostEvent extends Equatable {
  const LikePostEvent();
}

class LikePostPressed extends LikePostEvent {
  const LikePostPressed({this.id, this.liked});
  final dynamic id;
  final bool liked;

  @override
  List<Object> get props => [id, liked];
}
