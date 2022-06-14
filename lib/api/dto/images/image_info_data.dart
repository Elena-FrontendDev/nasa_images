import 'package:json_annotation/json_annotation.dart';

part 'image_info_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageInfoData {
  final String? title;
  final String? nasaId;

  const ImageInfoData({
    this.title,
    this.nasaId,
  });

  factory ImageInfoData.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageInfoDataToJson(this);
}
