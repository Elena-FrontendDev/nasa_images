import 'package:equatable/equatable.dart';
import 'package:nasa_images/features/images/domain/image_info.dart';
import 'package:nasa_images/features/images/domain/image_links.dart';

/// Image model
class ImageItem extends Equatable {
  final List<ImageInfo>? data;
  final List<ImageLinks>? links;

  @override
  List<Object?> get props => [data, links];

  const ImageItem({this.data, this.links});
}
