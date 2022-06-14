// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageItemResponseData _$ImageItemResponseDataFromJson(
        Map<String, dynamic> json) =>
    ImageItemResponseData(
      collection: json['collection'] == null
          ? null
          : ImageItemCollectionData.fromJson(
              json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageItemResponseDataToJson(
        ImageItemResponseData instance) =>
    <String, dynamic>{
      'collection': instance.collection?.toJson(),
    };
