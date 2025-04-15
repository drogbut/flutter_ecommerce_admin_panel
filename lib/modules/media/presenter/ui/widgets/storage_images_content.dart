import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/loaders/loader_animation.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/data/model/image.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/image_popup.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controllers/media_controller.dart';
import 'media_folder_dropdown.dart';

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
                    controller.getMediaImages();
                  }
                },
              ),
            ],
          ),

          /// Show Media
          Obx(
            () {
              // list of images
              final images = getSelectedFolderImages(controller);

              // loading
              if (controller.loading.value && images.isEmpty) {
                return TLoaderAnimation();
              }

              // Empty widget
              if (images.isEmpty) {
                return _buildEmptyWidget(context);
              }

              // Loaded
              return Wrap(
                alignment: WrapAlignment.start,
                spacing: TSizes.spaceBtwItems / 2,
                runSpacing: TSizes.spaceBtwItems / 2,
                children: images.map((image) {
                  return GestureDetector(
                    onTap: () => Get.dialog(ImagePopup(imageModel: image)),
                    child: SizedBox(
                      height: 180,
                      width: 140,
                      child: Column(
                        children: [
                          // image
                          TRoundedImage(
                            width: 80,
                            height: 100,
                            imageType: ImageType.network,
                            image: image.url,
                            fit: BoxFit.cover,
                            backgroundColor: TColors.primaryBackground,
                            //borderRadius: 10,
                          ),

                          // Title
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: TSizes.lg),
                            child: Text(
                              image.filename,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          /// Load More Button
          if (!controller.loading.value)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: TSizes.sm),
                  minimumSize: Size.fromHeight(50),
                ),
                label: Text('Load More'),
                icon: Icon(Iconsax.arrow_down),
                onPressed: () {
                  controller.loadMoreMediaImages();
                },
              ),
            ),
        ],
      ),
    );
  }

  List<ImageModel> getSelectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];

    if (controller.selectedPath.value == MediaCategory.banners) {
      images = controller.allBannerImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.brands) {
      images = controller.allBrandImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.products) {
      images = controller.allProductImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.users) {
      images = controller.allUserImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.categories) {
      images = controller.allCategoryImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    }

    return images;
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.lg * 2),
      child: TAnimationLoaderWidget(
        width: 500,
        height: 300,
        text: 'Select your desired folder',
        animation: TImages.packageAnimation,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
