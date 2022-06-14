import 'package:flutter/material.dart';
import 'package:nasa_images/assets/colors/colors.dart';
import 'package:nasa_images/assets/themes/text_style.dart';
import 'package:nasa_images/features/image_item/domain/image_item_info.dart';

class ImageInfoDetails extends StatelessWidget {
  final ImageItemInfo imageItemInfo;
  final Function({required WidgetBuilder builder}) showBottomSheet;

  const ImageInfoDetails({
    Key? key,
    required this.showBottomSheet,
    required this.imageItemInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showBottomSheet(
        builder: (context) => Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            minHeight: MediaQuery.of(context).size.height * 0.2,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (imageItemInfo.aVAILTitle?.isNotEmpty ?? false) ...[
                    Text(
                      imageItemInfo.aVAILTitle!,
                      style: textMedium.copyWith(
                        fontSize: 18.0,
                        color: textColorSecondary,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                  if (imageItemInfo.aVAILNASAID?.isNotEmpty ?? false) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NASA ID: ',
                          style: textMedium.copyWith(color: textColorSecondary),
                        ),
                        Expanded(child: Text(imageItemInfo.aVAILNASAID!)),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                  if (imageItemInfo.aVAILDescription?.isNotEmpty ?? false) ...[
                    Text(imageItemInfo.aVAILDescription!),
                    const SizedBox(height: 16.0),
                  ],
                  if (imageItemInfo.aVAILCenter?.isNotEmpty ?? false) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Center: ',
                          style: textMedium.copyWith(color: textColorSecondary),
                        ),
                        Text(imageItemInfo.aVAILCenter!),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                  if (imageItemInfo.aVAILLocation?.isNotEmpty ?? false) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location: ',
                          style: textMedium.copyWith(color: textColorSecondary),
                        ),
                        Text(imageItemInfo.aVAILLocation!),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      icon: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
    );
  }
}
