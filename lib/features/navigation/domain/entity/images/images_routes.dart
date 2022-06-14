import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_images/features/common/widgets/di_scope/di_scope.dart';
import 'package:nasa_images/features/image_item/di/image_item_scope.dart';
import 'package:nasa_images/features/image_item/screens/image_item_screen/image_item_screen_widget.dart';
import 'package:nasa_images/features/images/screens/images_main_screen/images_main_screen_widget.dart';
import 'package:nasa_images/features/navigation/domain/entity/app_route_names.dart';
import 'package:nasa_images/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the images feature.
final List<GoRoute> imagesRoutes = [
  GoRoute(
    path: AppRoutePaths.imagesScreen,
    name: AppRouteNames.imagesScreen,
    builder: (context, state) => const ImagesMainScreenWidget(),
  ),
  GoRoute(
    path: AppRoutePaths.imageItemScreen,
    name: AppRouteNames.imageItemScreen,
    builder: (context, state) {
      final scope = ImageItemScope(imageId: state.extra.toString());
      return DiScope<IImageItemScope>(
        key: ObjectKey(scope),
        factory: () {
          return scope;
        },
        child: const ImageItemScreenWidget(),
      );
    },
  ),
];
