import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_images/api/dto/images/image_data.dart';

part 'image_collection_data.g.dart';

/// DTO for Image model

@JsonSerializable(explicitToJson: true)
class ImageCollectionData {
  /// List of images
  final List<ImageData>? items;

  /// Create an instance [ImageCollectionData].
  const ImageCollectionData({this.items});

  factory ImageCollectionData.fromJson(Map<String, dynamic> json) =>
      _$ImageCollectionDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageCollectionDataToJson(this);
}
