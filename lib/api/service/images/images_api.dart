import 'package:dio/dio.dart';
import 'package:nasa_images/api/data/api_data_list.dart';
import 'package:nasa_images/api/dto/images/image_response_data.dart';
import 'package:nasa_images/api/service/images/images_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'images_api.g.dart';

@RestApi()
abstract class ImagesApi {
  factory ImagesApi(Dio dio, {String baseUrl}) = _ImagesApi;

  /// Метод для получения списка популярных фото.
  @GET(ImagesUrls.popular)
  Future<ImageResponseData?> getPopular();
}
