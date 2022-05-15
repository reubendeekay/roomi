import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:rxdart/rxdart.dart';

import 'package:roomy/feature/tenant_mode_listing/data_test.dart';
import 'load_more_post_event.dart';
import 'load_more_post_state.dart';

class LoadMorePostBloc extends Bloc<LoadMorePostEvent, LoadMorePostState> {
  LoadMorePostBloc() : super(LoadMorePostInitial());

  @override
  Stream<Transition<LoadMorePostEvent, LoadMorePostState>> transformEvents(
    Stream<LoadMorePostEvent> events,
    TransitionFunction<LoadMorePostEvent, LoadMorePostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<LoadMorePostState> mapEventToState(LoadMorePostEvent event) async* {
    final currentState = state;
    if (event is LoadMorePostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is LoadMorePostInitial) {
          final posts = await _fetchPosts(0, 3);
          yield LoadMorePostSuccess(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is LoadMorePostSuccess) {
          final posts = await _fetchPosts(currentState.posts.length, 3);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : LoadMorePostSuccess(
                  posts: currentState.posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield LoadMorePostFailure();
      }
    }
  }

  bool _hasReachedMax(LoadMorePostState state) =>
      state is LoadMorePostSuccess && state.hasReachedMax;

  Future<List<PostModel>> _fetchPosts(int startIndex, int limit) async {
    final List<PostModel> list = DataTest.listPost
        .map((dynamic post) => PostModel.fromJson(post))
        .toList();
    return list;
  }
}
