import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_images/api/repository/images/images_repository.dart';
import 'package:nasa_images/features/image_item/domain/image_item_info.dart';
import 'package:nasa_images/features/image_item/domain/image_item_link.dart';

part 'image_item_event.dart';
part 'image_item_state.dart';

class ImageItemBloc extends Bloc<ImageItemEvent, ImageItemState> {
  final IImagesRepository _imagesRepository;
  ImageItemBloc(this._imagesRepository) : super(ImageItemState()) {
    on<ImageLinksLoadEvent>(_loadImageLinks);
    on<ImageMetaDataLoadEvent>(_loadImageMetaData);
  }

  FutureOr<void> _loadImageLinks(
    ImageLinksLoadEvent event,
    Emitter<ImageItemaseState> emit,
  ) async {
    if (state.imageLinksResponseStatus != ResponseStatus.loading) {
      emit(state.copyWith(imageLinksResponseStatus: ResponseStatus.loading));
      try {
        final links = await _imagesRepository.imageItemLinks(event.imageId);
        emit(state.copyWith(
          imageItemLinks: links,
          imageLinksResponseStatus: ResponseStatus.suscess,
        ));
      } on Exception catch (_) {
        emit(state.copyWith(imageLinksResponseStatus: ResponseStatus.error));
      }
    }
  }

  FutureOr<void> _loadImageMetaData(
    ImageMetaDataLoadEvent event,
    Emitter<ImageItemaseState> emit,
  ) async {
    if (state.imageMetaDataResponseStatus != ResponseStatus.loading) {
      emit(state.copyWith(imageMetaDataResponseStatus: ResponseStatus.loading));
      try {
        final data = await _imagesRepository.getImageIdMetadata(event.imageId);
        if (kDebugMode) {
          print(data);
        }
        emit(state.copyWith(
          imageMetadata: data,
          imageMetaDataResponseStatus: ResponseStatus.suscess,
        ));
      } on Exception catch (_) {
        emit(state.copyWith(imageMetaDataResponseStatus: ResponseStatus.error));
      }
    }
  }
}
