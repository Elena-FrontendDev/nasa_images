import 'dart:ui';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:nasa_images/api/repository/images/images_repository.dart';
import 'package:nasa_images/api/service/image_item/image_item_api.dart';
import 'package:nasa_images/api/service/images/images_api.dart';
import 'package:nasa_images/config/app_config.dart';
import 'package:nasa_images/config/environment/environment.dart';
import 'package:nasa_images/features/images/service/images_bloc/images_bloc.dart';
import 'package:nasa_images/features/navigation/domain/entity/app_route_paths.dart';
import 'package:nasa_images/features/navigation/domain/entity/app_routes.dart';
import 'package:nasa_images/features/navigation/service/router.dart';
import 'package:nasa_images/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final Dio _dio;
  late final ErrorHandler _errorHandler;
  late final VoidCallback _applicationRebuilder;
  late final AppRouter _router;
  late final ImagesRepository _imagesRepository;
  late final ImagesBloc _imagesBloc;

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  VoidCallback get applicationRebuilder => _applicationRebuilder;

  @override
  AppRouter get router => _router;

  @override
  ImagesRepository get imagesRepository => _imagesRepository;

  @override
  ImagesBloc get imagesBloc => _imagesBloc;

  /// Create an instance [AppScope].
  AppScope({
    required VoidCallback applicationRebuilder,
  }) : _applicationRebuilder = applicationRebuilder {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter(
      delegate: AppRoutes(),
      initialLocation: AppRoutePaths.imagesScreen,
    );
    final apiClient = ImagesApi(_dio);
    final imageApiClient = ImageItemApi(_dio);
    _imagesRepository = ImagesRepository(apiClient, imageApiClient);
    _imagesBloc = ImagesBloc(_imagesRepository);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment<AppConfig>.instance().config.url
      ..connectTimeout = timeout.inMilliseconds
      ..receiveTimeout = timeout.inMilliseconds
      ..sendTimeout = timeout.inMilliseconds;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      final proxyUrl = Environment<AppConfig>.instance().config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    dio.interceptors.addAll(additionalInterceptors);

    if (Environment<AppConfig>.instance().isDebug) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// Repository for work with images.
  ImagesRepository get imagesRepository;

  /// Bloc for working with images states.
  ImagesBloc get imagesBloc;
}
