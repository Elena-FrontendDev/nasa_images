part of 'images_bloc.dart';

/// Base state for images.
@immutable
abstract class ImagesBaseState extends Equatable {
  /// List of popular images
  final List<ImageItem>? popularImages;
  @override
  List<Object> get props => [];

  /// Create an instance [ImagesBaseState].
  const ImagesBaseState({this.popularImages});
}

/// Base state containing images.

/// Init state.
class ImagesInitState extends ImagesBaseState {}

/// Loading image state.
class ImagesLoadingState extends ImagesBaseState {}

/// Loading error state.
class ImagesErrorState extends ImagesBaseState {}

/// Images state.
class ImagesState extends ImagesBaseState {
  /// Create an instance [ImagesState].
  const ImagesState(List<ImageItem> popularImages)
      : super(popularImages: popularImages);
}
