import 'package:equatable/equatable.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';

abstract class LoadMorePostState extends Equatable {
  const LoadMorePostState();

  @override
  List<Object> get props => [];
}

class LoadMorePostInitial extends LoadMorePostState {}

class LoadMorePostFailure extends LoadMorePostState {}

class LoadMorePostSuccess extends LoadMorePostState {
  const LoadMorePostSuccess({
    this.posts,
    this.hasReachedMax,
  });
  final List<PostModel> posts;
  final bool hasReachedMax;

  LoadMorePostSuccess copyWith({
    List<PostModel> posts,
    bool hasReachedMax,
  }) {
    return LoadMorePostSuccess(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}
