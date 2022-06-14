// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponseData _$ImageResponseDataFromJson(Map<String, dynamic> json) =>
    ImageResponseData(
      collectionData: json['collection'] == null
          ? null
          : ImageCollectionData.fromJson(
              json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageResponseDataToJson(ImageResponseData instance) =>
    <String, dynamic>{
      'collection': instance.collectionData?.toJson(),
    };
