import 'package:nasa_images/api/data/api_data_list.dart';
import 'package:nasa_images/features/images/domain/image.dart';
import 'package:nasa_images/features/images/domain/image_collection.dart';
import 'package:nasa_images/features/images/domain/image_info.dart';
import 'package:nasa_images/features/images/domain/image_links.dart';
import 'package:nasa_images/features/images/domain/image_response.dart';


/// Map ImageResponse from ImageResponseData
ImageResponse mapImageResponse(ImageResponseData data) {
  return ImageResponse(
    collection: mapImageCollection(data.collectionData),
  );
}

/// Map ImageCollection from ImageCollectionData
ImageCollection mapImageCollection(ImageCollectionData? data) {
  return ImageCollection(items: data?.items?.map(mapImage).toList());
}

ImageItem mapImage(ImageData data) {
  return ImageItem(
    data: data.data?.map(mapImageInfoData).toList(),
    links: data.links?.map(mapImageLinksData).toList(),
  );
}

ImageInfo mapImageInfoData(ImageInfoData data) {
  return ImageInfo(
    nasaId: data.nasaId,
    title: data.title,
  );
}

ImageLinks mapImageLinksData(ImageLinksData data) {
  return ImageLinks(href: data.href);
}
