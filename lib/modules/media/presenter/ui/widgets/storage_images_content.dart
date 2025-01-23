import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/media_folder_dropdown.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controllers/media_controller.dart';

class StorageImagesArea extends StatelessWidget {
  const StorageImagesArea({super.key});

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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: TSizes.sm),
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {},
              label: Text(
                'Load More',
              ),
              icon: Icon(Iconsax.arrow_down),
            ),
          ),
        ],
      ),
    );
  }
}
