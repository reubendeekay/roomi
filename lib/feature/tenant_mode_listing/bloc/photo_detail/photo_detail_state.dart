import 'package:equatable/equatable.dart';

abstract class PhotoDetailState extends Equatable {
  const PhotoDetailState();
}

class ImageSelectedInitial extends PhotoDetailState {
  const ImageSelectedInitial({this.imageSelected,this.index});
  final String imageSelected;
  final int index;
  @override
  List<Object> get props => [imageSelected,index];
}

class ImageSelectedLoading extends PhotoDetailState {
  @override
  List<Object> get props => [];
}

class ImageSelectedState extends PhotoDetailState {
  const ImageSelectedState({this.imageSelected,this.index});
  final String imageSelected;
  final int index;
  @override
  List<Object> get props => [imageSelected,index];
}

class ImageSelectedFailure extends PhotoDetailState {
  const ImageSelectedFailure({this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
