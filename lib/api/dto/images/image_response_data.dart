import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_images/api/dto/images/image_collection_data.dart';

part 'image_response_data.g.dart';

/// DTO for Image model

@JsonSerializable(explicitToJson: true)
class ImageResponseData extends Equatable {
  @JsonKey(name: 'collection')
  final ImageCollectionData? collectionData;

  @override
  List<Object?> get props => [collectionData];

  const ImageResponseData({this.collectionData});

  factory ImageResponseData.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseDataToJson(this);
}
