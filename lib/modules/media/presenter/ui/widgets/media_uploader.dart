import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/drag_and_drop.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/local_selected_images.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/media_content.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../controllers/media_controller.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;

    return Obx(
      () => controller.showImageUploaderSection.value
          ? Column(
              spacing: TSizes.spaceBtwSections,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Drag and drop Area
                DragAndDropArea(),

                /// locally selected images
                LocalSelectedImagesArea(),
              ],
            )
          : MediaContent(),
    );
  }
}
