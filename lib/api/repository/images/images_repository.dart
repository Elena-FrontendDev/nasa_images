import 'package:nasa_images/api/repository/images/image_item_mapper.dart';
import 'package:nasa_images/api/repository/images/images_mapper.dart';
import 'package:nasa_images/api/service/image_item/image_item_api.dart';
import 'package:nasa_images/api/service/images/images_api.dart';
import 'package:nasa_images/features/image_item/domain/image_item_info.dart';
import 'package:nasa_images/features/image_item/domain/image_item_link.dart';
import 'package:nasa_images/features/images/domain/image.dart';

/// Repository interface for working with images.
abstract class IImagesRepository {
  /// Return response data for popular images   .
  Future<List<ImageItem>?> getPopularImages();

  Future<List<ImageItemLink>?> imageItemLinks(String? imageId);
  Future<ImageItemInfo?> getImageIdMetadata(String? imageId);
}

/// Images repository
class ImagesRepository implements IImagesRepository {
  final ImagesApi _apiClient;
  final ImageItemApi _imageItemApi;

  /// Create an instance [ImagesRepository].
  const ImagesRepository(this._apiClient, this._imageItemApi);

  /// Return all popular images
  @override
  Future<List<ImageItem>?> getPopularImages() => _apiClient.getPopular().then(
        (value) => (value?.collectionData == null)
            ? null
            : mapImageResponse(value!).collection?.items,
      );

  @override
  Future<List<ImageItemLink>?> imageItemLinks(String? imageId) =>
      _imageItemApi.getImageLinks(imageId).then(
            (value) => value?.collection?.items == null
                ? null
                : mapImageItemResponse(value!).collection?.items,
          );

  @override
  Future<ImageItemInfo?> getImageIdMetadata(String? imageId) => _imageItemApi
      .getImageIdMetadata(imageId)
      .then((value) => value == null ? null : mapImageItemInfo(value));
}
