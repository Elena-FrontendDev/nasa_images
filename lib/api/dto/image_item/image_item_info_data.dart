import 'package:json_annotation/json_annotation.dart';

/// DTO Image item description info

part 'image_item_info_data.g.dart';

@JsonSerializable()
class ImageItemInfoData {
  @JsonKey(name: 'AVAIL:NASAID')
  final String? aVAILNASAID;
  @JsonKey(name: 'AVAIL:Description')
  final String? aVAILDescription;
  @JsonKey(name: 'AVAIL:DateCreated')
  final String? aVAILDateCreated;
  @JsonKey(name: 'AVAIL:Title')
  final String? aVAILTitle;
  @JsonKey(name: 'AVAIL:Center')
  final String? aVAILCenter;
  @JsonKey(name: 'AVAIL:Location')
  final String? aVAILLocation;

  /// Create an instance [ImageItemInfoData].
  const ImageItemInfoData({
    this.aVAILNASAID,
    this.aVAILDescription,
    this.aVAILDateCreated,
    this.aVAILTitle,
    this.aVAILCenter,
    this.aVAILLocation,
  });

  factory ImageItemInfoData.fromJson(Map<String, dynamic> json) =>
      _$ImageItemInfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageItemInfoDataToJson(this);
}
