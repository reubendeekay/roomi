import 'package:flutter_bloc/flutter_bloc.dart';

import 'photo_detail_event.dart';
import 'photo_detail_state.dart';

class PhotoDetailBloc extends Bloc<PhotoDetailEvent, PhotoDetailState> {
  PhotoDetailBloc()
      : super(const ImageSelectedInitial(
            imageSelected: 'images/tenant_mode/img@3x.png', index: 1));
  List<String> listPhoto = [
    'images/tenant_mode/img@3x.png',
    'images/tenant_mode/img_photo_detail@3x.png',
    'images/tenant_mode/img_photo_detail_2@3x.png',
    'images/tenant_mode/img_roommate_2@3x.png'
  ];
  @override
  Stream<PhotoDetailState> mapEventToState(PhotoDetailEvent event) async* {
    if (event is ImageSelectedEvent) {
      try {
        yield ImageSelectedLoading();
        for (int i = 0; i < event.listImage.length; i++) {
          if (i == event.indexItemSelected) {
            yield ImageSelectedState(
                imageSelected: event.listImage[i],
                index: event.indexItemSelected + 1);
          }
        }
      } catch (error) {
        yield ImageSelectedFailure(error: error.toString());
      }
    }
  }
}
