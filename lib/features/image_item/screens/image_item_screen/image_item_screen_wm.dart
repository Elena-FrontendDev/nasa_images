import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_images/features/app/di/app_scope.dart';
import 'package:nasa_images/features/image_item/di/image_item_scope.dart';
import 'package:nasa_images/features/image_item/domain/image_item_info.dart';
import 'package:nasa_images/features/image_item/domain/image_item_link.dart';
import 'package:nasa_images/features/image_item/screens/image_item_screen/image_item_screen_model.dart';
import 'package:nasa_images/features/image_item/screens/image_item_screen/image_item_screen_widget.dart';
import 'package:nasa_images/features/image_item/service/image_item_bloc/image_item_bloc.dart';
import 'package:provider/provider.dart';

ImageItemScreenWidgetModel defaultImageItemScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final imageItemDependencies = context.read<IImageItemScope>();
  final imageId = imageItemDependencies.imageId;
  final imageItemBloc = imageItemDependencies.imageItemBloc;
  final model = ImageItemScreenModel(
    appDependencies.errorHandler,
    imageId,
    imageItemBloc,
  );
  return ImageItemScreenWidgetModel(model);
}

/// Default widget model for ImageItemScreenWidget
class ImageItemScreenWidgetModel
    extends WidgetModel<ImageItemScreenWidget, ImageItemScreenModel>
    implements IImageItemScreenWidgetModel {
  late final StreamSubscription<ImageItemaseState> _stateStatusSubscription;
  final _imagesStateStream = EntityStateNotifier<List<ImageItemLink>?>();
  final _imageItemInfoStateStream = EntityStateNotifier<ImageItemInfo?>();

  @override
  ListenableState<EntityState<List<ImageItemLink>?>> get imageLinksListState =>
      _imagesStateStream;

  @override
  ListenableState<EntityState<ImageItemInfo?>> get imageItemInfoState =>
      _imageItemInfoStateStream;

  ImageItemScreenWidgetModel(ImageItemScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _stateStatusSubscription = model.imagesStateStream.listen(_updateState);
    _updateState(model.currentState);
  }

  @override
  void backButtonTap() {
    Navigator.of(context).pop();
  }

  @override
  void showBottomSheet({
    required WidgetBuilder builder,
  }) {
    showModalBottomSheet<ImageItemInfo>(
      context: context,
      builder: builder,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stateStatusSubscription.cancel();
    super.dispose();
  }

  void _updateState(ImageItemaseState state) {
    _updateImageLinksState(state);
    _updateImageInfoState(state);
  }

  void _updateImageLinksState(ImageItemaseState state) {
    if (state.imageLinksResponseStatus == ResponseStatus.loading) {
      _imagesStateStream.loading();
    } else if (state.imageLinksResponseStatus == ResponseStatus.suscess) {
      _imagesStateStream.content(state.imageItemLinks ?? []);
    } else if (state.imageLinksResponseStatus == ResponseStatus.error) {
      _imagesStateStream.error();
    }
  }

  void _updateImageInfoState(ImageItemaseState state) {
    if (state.imageMetaDataResponseStatus == ResponseStatus.loading) {
      _imageItemInfoStateStream.loading();
    } else if (state.imageMetaDataResponseStatus == ResponseStatus.suscess) {
      _imageItemInfoStateStream.content(state.imageMetadata);
    } else if (state.imageMetaDataResponseStatus == ResponseStatus.error) {
      _imageItemInfoStateStream.error();
    }
  }
}

abstract class IImageItemScreenWidgetModel extends IWidgetModel {
  /// State of state.
  ListenableState<EntityState<List<ImageItemLink>?>> get imageLinksListState;
  ListenableState<EntityState<ImageItemInfo?>> get imageItemInfoState;

  /// Callback on BackButton tap.
  void backButtonTap();

  /// Function to open bottom sheet.
  void showBottomSheet({
    required WidgetBuilder builder,
  });
}
