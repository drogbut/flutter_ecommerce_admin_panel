import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/buttons/tertiary.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_admin_panel/modules/media/data/model/image.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter_ecommerce_admin_panel/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ImagePopup extends StatelessWidget {
  final ImageModel imageModel;

  const ImagePopup({
    required this.imageModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
        child: LayoutBuilder(builder: (context, constraints) {
          final double dialogWidth = TDeviceUtils.isDesktopScreen(context)
              ? constraints.maxWidth * 0.4
              : double.infinity;

          return TRoundedContainer(
            width: dialogWidth,
            padding: EdgeInsets.all(TSizes.spaceBtwItems),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: TSizes.spaceBtwItems,
              children: [
                // Display a image with a option to close the dialog.
                SizedBox(
                  child: Stack(
                    children: [
                      TRoundedContainer(
                        backgroundColor: TColors.primaryBackground,
                        child: TRoundedImage(
                          image: imageModel.url,
                          imageType: ImageType.network,
                          applyImageRadius: true,
                          height: context.height * 0.4,
                          width: dialogWidth,
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(Iconsax.close_circle)))
                    ],
                  ),
                ),

                const Divider(),

                // Display various metadata about image.
                Row(
                  children: [
                    Expanded(
                        child: Text('Image Name:',
                            style: context.textTheme.bodyLarge)),
                    Expanded(
                        flex: 3,
                        child: Text(imageModel.filename,
                            style: context.textTheme.titleLarge)),
                  ],
                ),

                // Display the url image with the option to click on it.
                Row(
                  children: [
                    Expanded(
                        child: Text('Image Url:',
                            style: context.textTheme.bodyLarge)),
                    Expanded(
                        flex: 2,
                        child: Text(
                          imageModel.url,
                          style: context.textTheme.titleLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {
                        FlutterClipboard.copy(imageModel.url).then((value) =>
                            TLoaders.customToast(message: 'URL copied!'));
                      },
                      child: Text('copy url'),
                    ))
                  ],
                ),

                // Display the button to delete image
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TTertiaryButton(
                        onPressed: () {},
                        title: 'Delete Image',
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
