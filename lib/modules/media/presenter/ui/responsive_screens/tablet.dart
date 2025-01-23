import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controllers/media_controller.dart';
import '../widgets/drag_and_drop.dart';
import '../widgets/header_media.dart';
import '../widgets/local_selected_images.dart';
import '../widgets/storage_images_content.dart';

class MediaScreenTablet extends StatelessWidget {
  const MediaScreenTablet({super.key});

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
            /// Header section
            HeaderMedia(),

            Obx(() => controller.showImageUploaderSection.value
                ? Column(
                    spacing: TSizes.spaceBtwSections,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Drag and Drop
                      DragAndDropArea(),

                      /// Local Section
                      LocalSelectedImagesArea(),
                    ],
                  )
                : SizedBox.shrink()),

            /// Storage Section
            StorageImagesArea()
          ],
        ),
      ),
    );
  }
}
