import 'package:nasa_images/api/dto/images/image_response_data.dart';
import 'package:nasa_images/api/repository/images/images_mapper.dart';
import 'package:nasa_images/api/service/images/images_api.dart';
import 'package:nasa_images/features/images/domain/image.dart';
import 'package:nasa_images/features/images/domain/image_response.dart';

/// Repository interface for working with images.
abstract class IImagesRepository {
  /// Return response data for popular images   .
  Future<List<ImageItem>?> getPopularImages();
}

/// Images repository
class ImagesRepository implements IImagesRepository {
  final ImagesApi _apiClient;

  /// Create an instance [ImagesRepository].
  const ImagesRepository(this._apiClient);

  /// Return all popular images
  @override
  Future<List<ImageItem>?> getPopularImages() => _apiClient.getPopular().then(
        (value) => (value?.collectionData == null)
            ? null
            : mapImageResponse(value!).collection?.items,
      );
}
