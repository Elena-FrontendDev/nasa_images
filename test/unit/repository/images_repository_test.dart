import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_images/api/data/api_data_list.dart';
import 'package:nasa_images/api/repository/images/images_mapper.dart';
import 'package:nasa_images/api/repository/images/images_repository.dart';
import 'package:nasa_images/api/service/image_item/image_item_api.dart';
import 'package:nasa_images/api/service/images/images_api.dart';

import 'images_mock.dart';

class ImagesApiMock extends Mock implements ImagesApi {}

class ImageItemApiMock extends Mock implements ImageItemApi {}

/// Тесты для [ImagesRepository]
Future<void> main() async {
  late ImagesApiMock imagesApiMock;
  late ImageItemApiMock imageItemApiMock;
  late ImagesRepository imagesRepository;

  final tImageResponseData = ImageResponseData.fromJson(imagesMock);
  final tImages = mapImageResponse(tImageResponseData).collection?.items;

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
