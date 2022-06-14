import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_images/features/images/domain/image.dart';
import 'package:nasa_images/features/images/screens/images_main_screen/images_main_screen_wm.dart';

/// Main widget for ImagesMainScreen module
class ImagesMainScreenWidget
    extends ElementaryWidget<IImagesMainScreenWidgetModel> {
  /// Create an instance [ImagesMainScreenWidget]
  const ImagesMainScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultImagesMainScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IImagesMainScreenWidgetModel wm) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('NASA images'),
      ),
      body: EntityStateNotifierBuilder<List<ImageItem>>(
        listenableEntityState: wm.popularImagesListState,
        loadingBuilder: (context, _) => const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (_, images) {
          return (images?.isNotEmpty ?? false)
              ? ColoredBox(
                  color: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: ListView.builder(
                      itemBuilder: (_, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Image.network(
                            images?.elementAt(index).links?.first.href ?? '',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      itemCount: images?.length,
                    ),
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
