// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item_collection_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageItemCollectionData _$ImageItemCollectionDataFromJson(
        Map<String, dynamic> json) =>
    ImageItemCollectionData(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ImageItemLinkData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageItemCollectionDataToJson(
        ImageItemCollectionData instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
