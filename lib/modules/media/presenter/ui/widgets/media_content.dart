import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/buttons/primary.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/buttons/tertiary.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/presenter/ui/widgets/media_folder_dropdown.dart';
import 'package:flutter_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
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
                TRoundedContainer(
                  width: double.infinity,
                  showBorder: true,
                  borderColor: TColors.borderPrimary,
                  backgroundColor: TColors.primaryBackground,
                  padding: EdgeInsets.all(TSizes.spaceBtwItems),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Image
                      TRoundedImage(
                        imageType: ImageType.asset,
                        image: TImages.defaultMultiImageIcon,
                      ),

                      /// Text
                      Flexible(
                        fit: FlexFit.loose,
                        child: Stack(
                          children: [
                            DropzoneView(
                              mime: ['image/jpg', 'image/png'],
                              cursor: CursorType.grab,
                              operation: DragOperation.copy,
                              onCreated: (DropzoneViewController ctrl) => controller.dropzoneViewController = ctrl,
                              onLoaded: () => print('Zone loaded'),
                              onError: (String? ev) => print('Error: $ev'),
                              onHover: () => print('Zone hovered'),
                              onDropFile: (DropzoneFileInterface file) => print('Drop: ${file.name}'),
                              onDropString: (String s) => print('Drop: $s'),
                              onDropFiles: (List<DropzoneFileInterface>? files) => print('Drop multiple: $files'),
                              onDropStrings: (List<String>? strings) => print('Drop multiple: $strings'),
                              onLeave: () => print('Zone left'),
                            ),
                            Center(child: Text('Drag and Drop files here')),
                          ],
                        ),
                      ),

                      /// Button
                      SizedBox(child: OutlinedButton(onPressed: () {}, child: Text('Select Images'))),
                    ],
                  ),
                ),

                /// locally selected images
                TRoundedContainer(
                  width: double.infinity,
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
                                SizedBox(
                                    width: TSizes.buttonWidth,
                                    child: TPrimaryButton(title: 'Upload', onPressed: () {})),
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
                ),
              ],
            )
          : SizedBox.shrink(),
    );
  }
}
