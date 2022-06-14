import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:nasa_images/api/repository/images/images_repository.dart';
import 'package:nasa_images/api/service/image_item/image_item_api.dart';
import 'package:nasa_images/api/service/images/images_api.dart';
import 'package:nasa_images/config/app_config.dart';
import 'package:nasa_images/config/environment/environment.dart';
import 'package:nasa_images/features/image_item/service/image_item_bloc/image_item_bloc.dart';

/// Scope of dependencies which need just on the image item screen.
class ImageItemScope implements IImageItemScope {
  late final String? _imageId;
  late final ImageItemBloc _imageItemBloc;

  @override
  String? get imageId => _imageId;

  @override
  ImageItemBloc get imageItemBloc => _imageItemBloc;

  /// Create an instance [ImageItemScope].
  ImageItemScope({
    required String? imageId,
  }) : _imageId = imageId {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];
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

    final dio = _initDio(additionalInterceptors);
    final apiClient = ImagesApi(dio);
    final imageApiClient = ImageItemApi(dio);
    final imagesRepository = ImagesRepository(apiClient, imageApiClient);

    _imageItemBloc = ImageItemBloc(imagesRepository);
  }
}

/// Image item dependencies.
abstract class IImageItemScope {
  /// Selected image id
  String? get imageId;

  /// Bloc for working with image item state.
  ImageItemBloc get imageItemBloc;
}
