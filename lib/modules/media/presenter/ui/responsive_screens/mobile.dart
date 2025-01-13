import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controllers/media_controller.dart';
import '../widgets/header_media.dart';
import '../widgets/media_uploader.dart';

class MediaScreenMobile extends StatelessWidget {
  const MediaScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());

    return SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          spacing: TSizes.spaceBtwSections,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            HeaderMedia(),

            /// Drag and Drop area
            MediaUploader(),
          ],
        ),
      ),
    );
  }
}
