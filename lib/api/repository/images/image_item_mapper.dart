import 'package:nasa_images/api/data/api_data_list.dart';
import 'package:nasa_images/features/image_item/domain/image_item_collection.dart';
import 'package:nasa_images/features/image_item/domain/image_item_info.dart';
import 'package:nasa_images/features/image_item/domain/image_item_link.dart';
import 'package:nasa_images/features/image_item/domain/image_item_response.dart';

/// Map ImageItemCollection from ImageItemCollectionData
ImageItemResponse mapImageItemResponse(ImageItemResponseData data) {
  return ImageItemResponse(
    collection: mapImageItemCollection(data.collection),
  );
}

/// Map ImageItemCollection from ImageItemCollectionData
ImageItemCollection mapImageItemCollection(ImageItemCollectionData? data) {
  return ImageItemCollection(
    items: data?.items?.map(mapImageItemLink).toList(),
  );
}

/// Map ImageItemLink from ImageItemLinkData
ImageItemLink mapImageItemLink(ImageItemLinkData data) {
  return ImageItemLink(href: data.href);
}

ImageItemInfo mapImageItemInfo(ImageItemInfoData data) {
  return ImageItemInfo(
    aVAILNASAID: data.aVAILNASAID,
    aVAILTitle: data.aVAILTitle,
    aVAILDateCreated: data.aVAILDateCreated,
    aVAILCenter: data.aVAILCenter,
    aVAILDescription: data.aVAILDescription,
    aVAILLocation: data.aVAILLocation,
  );
}
