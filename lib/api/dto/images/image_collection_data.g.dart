// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_collection_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageCollectionData _$ImageCollectionDataFromJson(Map<String, dynamic> json) =>
    ImageCollectionData(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageCollectionDataToJson(
        ImageCollectionData instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
