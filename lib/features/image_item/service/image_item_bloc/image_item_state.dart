part of 'image_item_bloc.dart';

@immutable
abstract class ImageItemaseState extends Equatable {
  final List<ImageItemLink>? imageItemLinks;
  final ResponseStatus? imageLinksResponseStatus;
  final ImageItemInfo? imageMetadata;
  final ResponseStatus? imageMetaDataResponseStatus;

  @override
  List<Object?> get props => [
        imageItemLinks,
        imageLinksResponseStatus,
        imageMetadata,
        imageMetaDataResponseStatus,
      ];

  const ImageItemaseState({
    this.imageItemLinks,
    this.imageLinksResponseStatus,
    this.imageMetadata,
    this.imageMetaDataResponseStatus,
  });
}

class ImageItemState extends ImageItemaseState {
  final List<ImageItemLink>? imageItemLinks;
  final ResponseStatus? imageLinksResponseStatus;
  final ImageItemInfo? imageMetadata;
  final ResponseStatus? imageMetaDataResponseStatus;

  @override
  List<Object?> get props => [
        imageItemLinks,
        imageLinksResponseStatus,
        imageMetadata,
        imageMetaDataResponseStatus,
      ];

  const ImageItemState({
    this.imageItemLinks,
    this.imageLinksResponseStatus,
    this.imageMetadata,
    this.imageMetaDataResponseStatus,
  });

  ImageItemState copyWith({
    List<ImageItemLink>? imageItemLinks,
    ResponseStatus? imageLinksResponseStatus,
    ImageItemInfo? imageMetadata,
    ResponseStatus? imageMetaDataResponseStatus,
  }) {
    return ImageItemState(
      imageItemLinks: imageItemLinks ?? this.imageItemLinks,
      imageLinksResponseStatus:
          imageLinksResponseStatus ?? this.imageLinksResponseStatus,
      imageMetadata: imageMetadata ?? this.imageMetadata,
      imageMetaDataResponseStatus:
          imageMetaDataResponseStatus ?? this.imageMetaDataResponseStatus,
    );
  }
}

enum ResponseStatus { loading, suscess, error }
