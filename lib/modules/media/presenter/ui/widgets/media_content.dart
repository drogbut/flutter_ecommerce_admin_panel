import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/buttons/primary.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/buttons/tertiary.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/media_folder_dropdown.dart';
import 'package:flutter_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controllers/media_controller.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

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
                    SizedBox(width: TSizes.buttonWidth, child: TPrimaryButton(title: 'Upload', onPressed: () {})),
                ],
              ),
            ],
          ),

          /// Show Media
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
                //borderRadius: 10,
                border: Border.all(color: TColors.primaryBackground, width: 2),
                padding: 0,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                //borderRadius: 10,
                border: Border.all(color: TColors.primaryBackground, width: 2),
                padding: 0,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                //borderRadius: 10,
                border: Border.all(color: TColors.primaryBackground, width: 2),
                padding: 0,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                //borderRadius: 10,
                border: Border.all(color: TColors.primaryBackground, width: 2),
                padding: 0,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                //borderRadius: 10,
                border: Border.all(color: TColors.primaryBackground, width: 2),
                padding: 0,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                //borderRadius: 10,
                border: Border.all(color: TColors.primaryBackground, width: 2),
                padding: 0,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                backgroundColor: TColors.primaryBackground,
                imageType: ImageType.asset,
                image: TImages.darkAppLogo,
                //borderRadius: 10,
                border: Border.all(color: TColors.primaryBackground, width: 2),
                padding: 0,
              ),
            ],
          ),

          /// Load More Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: TSizes.buttonWidth,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(TSizes.md)),
                    onPressed: () {},
                    label: Text('Load More'),
                    icon: Icon(Iconsax.arrow_down),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
