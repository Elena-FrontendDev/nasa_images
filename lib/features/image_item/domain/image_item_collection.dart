import 'package:equatable/equatable.dart';
import 'package:nasa_images/features/image_item/domain/image_item_link.dart';

/// Image item
class ImageItemCollection extends Equatable {
  /// List with links for image item
  final List<ImageItemLink>? items;

  @override
  List<Object?> get props => [items];

  /// Create an instance [ImageItemCollection].
  const ImageItemCollection({this.items});
}
