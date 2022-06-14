import 'package:json_annotation/json_annotation.dart';

part 'image_item_link_data.g.dart';

/// DTO for ImageItemLin
@JsonSerializable()
class ImageItemLinkData {
  String? href;

  ImageItemLinkData({this.href});

  factory ImageItemLinkData.fromJson(Map<String, dynamic> json) =>
      _$ImageItemLinkDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageItemLinkDataToJson(this);
}
