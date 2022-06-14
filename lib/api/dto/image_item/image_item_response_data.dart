import 'package:json_annotation/json_annotation.dart';

import 'package:nasa_images/api/dto/image_item/image_item_collection_data.dart';

part 'image_item_response_data.g.dart';

/// DTO for image item response data
@JsonSerializable(explicitToJson: true)
class ImageItemResponseData {
  final ImageItemCollectionData? collection;

  const ImageItemResponseData({this.collection});

  factory ImageItemResponseData.fromJson(Map<String, dynamic> json) =>
      _$ImageItemResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageItemResponseDataToJson(this);
}
