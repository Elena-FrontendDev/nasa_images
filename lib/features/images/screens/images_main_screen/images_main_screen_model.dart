import 'package:elementary/elementary.dart';
import 'package:nasa_images/features/images/service/images_bloc/images_bloc.dart';

/// Default Elementary model for ImagesMainScreen module
class ImagesMainScreenModel extends ElementaryModel {
  /// Bloc for working with images states.
  final ImagesBloc _imagesBloc;

  /// Gives the current state.
  ImagesBaseState get currentState => _imagesBloc.state;

  /// Stream to track the state of the profile_bloc.
  Stream<ImagesBaseState> get imagesStateStream => _imagesBloc.stream;

  /// Create an instance [ImagesMainScreenModel].
  ImagesMainScreenModel(this._imagesBloc, ErrorHandler errorHandler)
      : super(errorHandler: errorHandler);

  @override
  void init() {
    super.init();
    _imagesBloc.add(ImagesLoadEvent());
  }
}
