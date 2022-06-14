import 'package:json_annotation/json_annotation.dart';

part 'image_links_data.g.dart';

@JsonSerializable()
class ImageLinksData {
  final String? href;

  const ImageLinksData({this.href});

  factory ImageLinksData.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinksDataToJson(this);
}
