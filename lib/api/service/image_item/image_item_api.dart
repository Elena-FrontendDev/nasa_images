import 'package:dio/dio.dart';
import 'package:nasa_images/api/data/api_data_list.dart';
import 'package:nasa_images/api/service/image_item/image_item_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'image_item_api.g.dart';

@RestApi()
abstract class ImageItemApi {
  factory ImageItemApi(Dio dio, {String baseUrl}) = _ImageItemApi;

  /// Метод для получения списка ссылок для фото в разных разрешениях.
  @GET(Image_itemUrls.assetImageId)
  Future<ImageItemResponseData?> getImageLinks(
    @Path('image_id') String? imageId,
  );

  /// Метод для получения информации о фото по id.
  @GET(Image_itemUrls.imageIdMetadata)
  Future<ImageItemInfoData?> getImageIdMetadata(
    @Path('image_id') String? imageId,
  );
}
