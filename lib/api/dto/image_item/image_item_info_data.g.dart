// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageItemInfoData _$ImageItemInfoDataFromJson(Map<String, dynamic> json) =>
    ImageItemInfoData(
      aVAILNASAID: json['AVAIL:NASAID'] as String?,
      aVAILDescription: json['AVAIL:Description'] as String?,
      aVAILDateCreated: json['AVAIL:DateCreated'] as String?,
      aVAILTitle: json['AVAIL:Title'] as String?,
      aVAILCenter: json['AVAIL:Center'] as String?,
      aVAILLocation: json['AVAIL:Location'] as String?,
    );

Map<String, dynamic> _$ImageItemInfoDataToJson(ImageItemInfoData instance) =>
    <String, dynamic>{
      'AVAIL:NASAID': instance.aVAILNASAID,
      'AVAIL:Description': instance.aVAILDescription,
      'AVAIL:DateCreated': instance.aVAILDateCreated,
      'AVAIL:Title': instance.aVAILTitle,
      'AVAIL:Center': instance.aVAILCenter,
      'AVAIL:Location': instance.aVAILLocation,
    };
