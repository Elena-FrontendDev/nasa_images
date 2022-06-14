part of 'image_item_bloc.dart';

@immutable
abstract class ImageItemEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const ImageItemEvent();
}

/// Load image links event.
class ImageLinksLoadEvent extends ImageItemEvent {
  final String? imageId;

  @override
  List<Object?> get props => [imageId];

  const ImageLinksLoadEvent(this.imageId);
}

/// Load image metadata event.
class ImageMetaDataLoadEvent extends ImageItemEvent {
  final String? imageId;

  @override
  List<Object?> get props => [imageId];

  const ImageMetaDataLoadEvent(this.imageId);
}