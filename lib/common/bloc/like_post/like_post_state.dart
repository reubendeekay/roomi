import 'package:equatable/equatable.dart';

abstract class LikePostState extends Equatable {
  const LikePostState();
}

class LikePostInitial extends LikePostState {
  @override
  List<Object> get props => [];
}

class LikePostLoading extends LikePostState {
  @override
  List<Object> get props => [];
}

class LikePostSelectedState extends LikePostState {
  const LikePostSelectedState({this.listPost});
  final List<Map<String, dynamic>> listPost;

  LikePostSelectedState copyWith({List<Map<String, dynamic>> listPost}) {
    return LikePostSelectedState(
      listPost: listPost ?? this.listPost,
    );
  }
  @override
  List<Object> get props => [listPost];
}

class LikePostFailure extends LikePostState {
  const LikePostFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
