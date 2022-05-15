import 'package:equatable/equatable.dart';

abstract class PhotoDetailEvent extends Equatable {
  const PhotoDetailEvent();
}

class ImageSelectedEvent extends PhotoDetailEvent {
  const ImageSelectedEvent(
      {this.listImage, this.indexItemSelected})
      : super();
  final List<String> listImage;
  final int indexItemSelected;
  @override
  List<Object> get props => [listImage, indexItemSelected];
}
