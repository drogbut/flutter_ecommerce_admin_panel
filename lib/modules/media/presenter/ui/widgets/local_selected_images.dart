import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/buttons/primary.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/buttons/tertiary.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/media_folder_dropdown.dart';
import 'package:flutter_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controllers/media_controller.dart';

class LocalSelectedImagesArea extends StatelessWidget {
  const LocalSelectedImagesArea({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;

    return TRoundedContainer(
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media images header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Selected folder text
              Row(
                spacing: TSizes.spaceBtwItems,
                children: [
                  Text('Selected Folder',
                      style: context.textTheme.headlineSmall),

                  /// Category DropDown menu
                  MediaFolderDropDown(
                    onChanged: (MediaCategory? value) {
                      if (value != null) {
                        controller.selectedPath.value = value;
                      }
                    },
                  ),
                ],
              ),

              /// Remove Button
              Row(
                spacing: TSizes.sm,
                children: [
                  SizedBox(
                      width: TSizes.buttonWidth,
                      child: TTertiaryButton(
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: TColors.error),
                        title: 'Remove All',
                        onPressed: () =>
                            controller.selectedImagesToUpload.clear(),
                      )),

                  /// Upload Button
                  if (!TDeviceUtils.isMobileScreen(context))
                    SizedBox(
                      width: TSizes.buttonWidth,
                      child: TPrimaryButton(
                        title: 'Upload',
                        onPressed: () => controller.uploadImageConfirmations(),
                      ),
                    ),
                ],
              ),
            ],
          ),

          /// Show Media
          Obx(
            () => Wrap(
              alignment: WrapAlignment.start,
              spacing: TSizes.spaceBtwItems / 2,
              runSpacing: TSizes.spaceBtwItems / 2,
              children: controller.selectedImagesToUpload
                  .where((image) => image.localImageToDisplay != null)
                  .map((image) => TRoundedImage(
                        width: 80,
                        height: 100,
                        backgroundColor: TColors.primaryBackground,
                        border: Border.all(
                            color: TColors.primaryBackground, width: 2),
                        padding: 0,
                        imageType: ImageType.memory,
                        memoryImage: image.localImageToDisplay,
                        fit: BoxFit.cover,
                        //borderRadius: 10,
                      ))
                  .toList(),
            ),
          ),

          /// Mobile button
          if (TDeviceUtils.isMobileScreen(context))
            TPrimaryButton(
              title: 'Upload',
              onPressed: () => controller.uploadImageConfirmations(),
            )
        ],
      ),
    );
  }
}
