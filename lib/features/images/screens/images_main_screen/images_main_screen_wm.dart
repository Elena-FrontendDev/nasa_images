import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_images/features/app/di/app_scope.dart';
import 'package:nasa_images/features/images/domain/image.dart';
import 'package:nasa_images/features/images/screens/images_main_screen/images_main_screen_model.dart';
import 'package:nasa_images/features/images/screens/images_main_screen/images_main_screen_widget.dart';
import 'package:nasa_images/features/images/service/images_bloc/images_bloc.dart';
import 'package:provider/provider.dart';

/// Factory for [ImagesMainScreenWidgetModel].
ImagesMainScreenWidgetModel defaultImagesMainScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();

  final model = ImagesMainScreenModel(
    appDependencies.imagesBloc,
    appDependencies.errorHandler,
  );

  return ImagesMainScreenWidgetModel(model);
}

/// Default widget model for ImagesMainScreenWidget
class ImagesMainScreenWidgetModel
    extends WidgetModel<ImagesMainScreenWidget, ImagesMainScreenModel>
    implements IImagesMainScreenWidgetModel {
  late final StreamSubscription<ImagesBaseState> _stateStatusSubscription;
  final _popularImagesListState = EntityStateNotifier<List<ImageItem>>();

  @override
  ListenableState<EntityState<List<ImageItem>>> get popularImagesListState =>
      _popularImagesListState;

  ImagesMainScreenWidgetModel(ImagesMainScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _stateStatusSubscription = model.imagesStateStream.listen(_updateState);
    _updateState(model.currentState);
  }

  @override
  void dispose() {
    _stateStatusSubscription.cancel();
    super.dispose();
  }

  void _updateState(ImagesBaseState state) {
    if (state is ImagesInitState) {
      _popularImagesListState.loading();
    } else if (state is ImagesState) {
      _popularImagesListState.content(state.popularImages ?? []);
    } else if (state is ImagesErrorState) {
      _popularImagesListState.error();
    }
  }
}

/// Interface of [IImagesMainScreenWidgetModel].
abstract class IImagesMainScreenWidgetModel extends IWidgetModel {
  /// State of state.
  ListenableState<EntityState<List<ImageItem>>> get popularImagesListState;
}
