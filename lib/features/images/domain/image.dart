import 'package:nasa_images/features/images/domain/image_info.dart';
import 'package:nasa_images/features/images/domain/image_links.dart';

/// Image model
class ImageItem {
  final List<ImageInfo>? data;
  final List<ImageLinks>? links;

  const ImageItem({this.data, this.links});
}
