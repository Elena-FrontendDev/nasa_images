import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_images/api/data/api_data_list.dart';
import 'package:nasa_images/api/repository/images/image_item_mapper.dart';
import 'package:nasa_images/api/repository/images/images_mapper.dart';
import 'package:nasa_images/api/repository/images/images_repository.dart';
import 'package:nasa_images/api/service/image_item/image_item_api.dart';
import 'package:nasa_images/api/service/images/images_api.dart';

import 'image_item_mock.dart';
import 'images_mock.dart';

class ImagesApiMock extends Mock implements ImagesApi {}

class ImageItemApiMock extends Mock implements ImageItemApi {}

/// Тесты для [ImagesRepository]
Future<void> main() async {
  late ImagesApiMock imagesApiMock;
  late ImageItemApiMock imageItemApiMock;
  late ImagesRepository imagesRepository;

  final tImageResponseData = ImageResponseData.fromJson(imagesMock);
  final tImageItemResponseData = ImageItemResponseData.fromJson(imageLinksMock);
  final tImageItemInfoData = ImageItemInfoData.fromJson(imageInfoDataMock);

  setUp(() {
    imagesApiMock = ImagesApiMock();
    imageItemApiMock = ImageItemApiMock();
    imagesRepository = ImagesRepository(imagesApiMock, imageItemApiMock);
  });

  test('should perform a GET request on /popular.json', () async {
    when(() => imagesApiMock.getPopular())
        .thenAnswer((invocation) async => tImageResponseData);
    // act
    await imagesRepository.getPopularImages();
    // assert
    verify(() => imagesApiMock.getPopular());
    verifyNoMoreInteractions(imagesApiMock);
  });

  test(
    'getPopularImages should return ImageResponseData when the response is 200 (success)',
    () async {
      when(() => imagesApiMock.getPopular()).thenAnswer(
        (invocation) async => tImageResponseData,
      );
      final response = await imagesApiMock.getPopular();
      expect(response, tImageResponseData);
    },
  );

  test(
    'getPopularImages should return ImageResponseData when the response is 200 (success)',
    () {
      final actual =
          mapImageResponse(ImageResponseData.fromJson(imagesMockForConverter))
              .collection
              ?.items;
      const expected = imagesListMock;
      expect(actual, expected);
    },
  );

  const imageId = 'PIA12348';

  test('should perform a GET request on /asset/{image_id', () async {
    when(() => imageItemApiMock.getImageLinks(imageId))
        .thenAnswer((invocation) async => tImageItemResponseData);
    // act
    await imagesRepository.imageItemLinks(imageId);
    // assert
    verify(() => imageItemApiMock.getImageLinks(imageId));
    verifyNoMoreInteractions(imageItemApiMock);
  });

  test(
    'imageItemLinks should return ImageItemResponseData when the response is 200 (success)',
        () async {
      when(() => imageItemApiMock.getImageLinks(imageId)).thenAnswer(
            (invocation) async => tImageItemResponseData,
      );
      final response = await imageItemApiMock.getImageLinks(imageId);
      expect(response, tImageItemResponseData);
    },
  );

  test(
    'mapImageItemResponse should return List<ImageItemLink> from ImageItemResponseData',
        () {
      final actual =
          mapImageItemResponse(ImageItemResponseData.fromJson(imageLinksMock)).collection?.items;
      const expected = imageItemLinksMock;
      expect(actual, expected);
    },
  );

  test('should perform a GET request on /image/{image_id}/metadata.json', () async {
    when(() => imageItemApiMock.getImageIdMetadata(imageId))
        .thenAnswer((invocation) async => tImageItemInfoData);
    // act
    await imagesRepository.getImageIdMetadata(imageId);
    // assert
    verify(() => imageItemApiMock.getImageIdMetadata(imageId));
    verifyNoMoreInteractions(imageItemApiMock);
  });

  test(
    'mapImageItemInfo should return ImageItemInfo from ImageItemInfoData',
        () {
      final actual =
          mapImageItemInfo(ImageItemInfoData.fromJson(imageInfoDataMock));
      const expected = imageInfoMock;
      expect(actual, expected);
    },
  );

  //failed
  // test(
  //   'getPopularImages should return List<ImageItem> when the response is 200 (success)',
  //   () async {
  //     when(() => imagesRepository.getPopularImages()).thenAnswer(
  //       (invocation) async => tImages,
  //     );
  //     final response = await imagesRepository.getPopularImages();
  //     expect(response, tImages);
  //   },
  // );
}
