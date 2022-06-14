import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_images/api/dto/images/image_info_data.dart';
import 'package:nasa_images/api/dto/images/image_links_data.dart';

part 'image_data.g.dart';

/// DTO for Image model
@JsonSerializable(explicitToJson: true)
class ImageData {
  /// Image data info
  final List<ImageInfoData>? data;

  /// Image links
  final List<ImageLinksData>? links;

  /// Create an instance [ImageData].
  const ImageData({this.data, this.links});

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}
