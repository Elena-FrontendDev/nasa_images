part of 'images_bloc.dart';

/// Basic profile event.
@immutable
abstract class ImagesBaseEvent extends Equatable {
  @override
  List<Object> get props => [];

  /// Constructor.
  const ImagesBaseEvent();
}

/// Images load event.
class ImagesLoadEvent extends ImagesBaseEvent {}