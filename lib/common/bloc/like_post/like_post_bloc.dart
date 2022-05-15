import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_like_post.dart';

class LikePostBloc extends Bloc<LikePostEvent, LikePostState> {
  LikePostBloc() : super(LikePostInitial());
  static final List<Map<String, dynamic>> listPost = [
    <String, dynamic>{
      'id': 1,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'liked': false,
    },
    <String, dynamic>{
      'id': 2,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'liked': false,
    },
    <String, dynamic>{
      'id': 3,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'liked': false,
    },
    <String, dynamic>{
      'id': 4,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'liked': false,
    },
    <String, dynamic>{
      'id': 5,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'liked': false,
    },
    <String, dynamic>{
      'id': 6,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'liked': false,
    },
    <String, dynamic>{
      'id': 7,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'liked': false,
    },
  ];
  @override
  Stream<LikePostState> mapEventToState(LikePostEvent event) async* {
    if (event is LikePostPressed) {
      try {
        yield LikePostLoading();
        for (int i = 0; i < listPost.length; i++) {
          if (listPost[i]['id'] == event.id) {
            listPost[i]['liked'] = event.liked;
          }
        }
        yield LikePostSelectedState(listPost: listPost);
      } catch (error) {
        yield LikePostFailure(error: error.toString());
      }
    }
  }
}
