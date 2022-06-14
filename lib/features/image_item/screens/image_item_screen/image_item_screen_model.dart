import 'package:elementary/elementary.dart';
import 'package:nasa_images/features/image_item/service/image_item_bloc/image_item_bloc.dart';

/// Default Elementary model for ImageItemScreen module
class ImageItemScreenModel extends ElementaryModel {
  final String? _imageId;
  final ImageItemBloc _imageItemBloc;

  /// Gives the current state.
  ImageItemaseState get currentState => _imageItemBloc.state;

  /// Stream to track the state of the profile_bloc.
  Stream<ImageItemaseState> get imagesStateStream => _imageItemBloc.stream;

  ImageItemScreenModel(
    ErrorHandler errorHandler,
    this._imageId,
    this._imageItemBloc,
  ) : super(errorHandler: errorHandler);

  @override
  void init() {
    super.init();
    _imageItemBloc
      ..add(ImageLinksLoadEvent(_imageId))
      ..add(ImageMetaDataLoadEvent(_imageId));
  }
}
