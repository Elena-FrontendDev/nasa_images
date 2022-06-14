import 'package:go_router/go_router.dart';
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
];
