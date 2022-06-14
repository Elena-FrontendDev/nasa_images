import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_images/api/dto/image_item/image_item_link_data.dart';

part 'image_item_collection_data.g.dart';

/// DTO for Image item
@JsonSerializable(explicitToJson: true)
class ImageItemCollectionData {
  /// List with links for image item
  final List<ImageItemLinkData>? items;

  /// Create an instance [ImageItemCollectionData].
  const ImageItemCollectionData({this.items});

  factory ImageItemCollectionData.fromJson(Map<String, dynamic> json) =>
      _$ImageItemCollectionDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageItemCollectionDataToJson(this);
}
