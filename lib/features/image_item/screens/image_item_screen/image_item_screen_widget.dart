import 'package:collection/collection.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_images/features/image_item/domain/image_item_info.dart';
import 'package:nasa_images/features/image_item/domain/image_item_link.dart';
import 'package:nasa_images/features/image_item/screens/image_item_screen/image_item_screen_wm.dart';
import 'package:nasa_images/features/image_item/widgets/image_info_details.dart';

/// Main widget for ImageItemScreen module
class ImageItemScreenWidget
    extends ElementaryWidget<IImageItemScreenWidgetModel> {
  const ImageItemScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultImageItemScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IImageItemScreenWidgetModel wm) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          onPressed: wm.backButtonTap,
        ),
        title: EntityStateNotifierBuilder<ImageItemInfo?>(
          listenableEntityState: wm.imageItemInfoState,
          builder: (context, data) {
            return Text(data?.aVAILTitle ?? 'NASA images');
          },
        ),
      ),
      body: EntityStateNotifierBuilder<List<ImageItemLink>?>(
        listenableEntityState: wm.imageLinksListState,
        builder: (_, links) {
          if (links?.isNotEmpty ?? false) {
            final url = links
                    ?.firstWhereOrNull(
                      (element) =>
                          element.href?.toString().endsWith('medium.jpg') ??
                          false,
                    )
                    ?.href ??
                links
                    ?.firstWhere((element) => element.href?.isNotEmpty ?? false)
                    .href ??
                '';
            return Stack(
              children: [
                ColoredBox(
                  color: Colors.black,
                  child: Center(child: Image.network(url)),
                ),
                EntityStateNotifierBuilder<ImageItemInfo?>(
                  listenableEntityState: wm.imageItemInfoState,
                  builder: (_, info) {
                    return info != null
                        ? Align(
                            alignment: Alignment.topRight,
                            child: ImageInfoDetails(
                              imageItemInfo: info,
                              showBottomSheet: wm.showBottomSheet,
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
