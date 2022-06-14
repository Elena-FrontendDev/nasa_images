import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nasa_images/api/repository/images/images_repository.dart';
import 'package:nasa_images/features/images/domain/image.dart';

part 'images_event.dart';
part 'images_state.dart';

/// Bloc for working with images states.
class ImagesBloc extends Bloc<ImagesBaseEvent, ImagesBaseState> {
  final IImagesRepository _imagesRepository;

  /// Create an instance [ImagesBloc].
  ImagesBloc(this._imagesRepository) : super(ImagesInitState()) {
    on<ImagesLoadEvent>(_loadPopularImages);
  }

  FutureOr<void> _loadPopularImages(
    ImagesLoadEvent event,
    Emitter<ImagesBaseState> emit,
  ) async {
    final state = this.state;
    if (state is! ImagesLoadingState) {
      emit(ImagesLoadingState());
      try {
        final items = await _imagesRepository.getPopularImages() ?? [];
        emit(ImagesState(items));
      } on Exception catch (_) {
        emit(ImagesErrorState());
      }
    }
  }
}
