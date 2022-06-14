class Image_itemUrls {
  static const String assetImageId = '$_apiUrl/asset/{image_id}';
  static const String imageIdMetadata =
      '$_apiAssetsUrl/image/{image_id}/metadata.json';

  static const String _apiUrl = 'https://images-api.nasa.gov';
  static const String _apiAssetsUrl = 'https://images-assets.nasa.gov';

  Image_itemUrls._();
}
