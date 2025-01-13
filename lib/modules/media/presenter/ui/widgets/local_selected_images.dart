import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/buttons/primary.dart';
import '../../../../../common/widgets/buttons/tertiary.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../controllers/media_controller.dart';
import 'media_folder_dropdown.dart';

class LocalSelectedImagesArea extends StatelessWidget {
  const LocalSelectedImagesArea({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;

    return TRoundedContainer(
      width: double.infinity,
      height: 250,
      showBorder: true,
      borderColor: TColors.borderPrimary,
      backgroundColor: TColors.primaryBackground,
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Selected folders header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Selected folder text
              Row(
                spacing: TSizes.spaceBtwItems,
                children: [
                  Text('Selected Folder', style: context.textTheme.headlineSmall),

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
                        title: 'Remove All',
                        onPressed: () {},
                      )),

                  /// Upload Button
                  if (!TDeviceUtils.isMobileScreen(context))
                    TPrimaryButton(
                      padding: EdgeInsets.all(TSizes.md),
                      title: 'Upload',
                      onPressed: () {},
                    ),
                ],
              ),
            ],
          ),

          /// Images
          Wrap(
            spacing: TSizes.spaceBtwItems / 2,
            runSpacing: TSizes.spaceBtwItems / 2,
            children: [
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
              ),
            ],
          ),

          /// Upload Button
          if (TDeviceUtils.isMobileScreen(context)) TPrimaryButton(title: 'Upload', onPressed: () {}),
        ],
      ),
    );
  }
}
