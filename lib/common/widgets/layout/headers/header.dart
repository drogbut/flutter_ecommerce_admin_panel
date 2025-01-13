import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../modules/authentication/personalization/presenter/controllers/user_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../images/t_rounded_image.dart';
import '../../shimmers/shimmer.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  /// The global key to access of Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Container(
      decoration: BoxDecoration(
        color: TColors.white,
        border: Border.all(color: TColors.grey, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        elevation: 0.0,

        /// mobile Menu
        leading: (!TDeviceUtils.isDesktopScreen(context))
            ? IconButton(onPressed: () => scaffoldKey?.currentState?.openDrawer(), icon: Icon(Iconsax.menu))
            : null,

        /// Search menu
        title: (TDeviceUtils.isDesktopScreen(context))
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.search_normal),
                    hintText: TTexts.homeAppbarSearchText,
                  ),
                ),
              )
            : null,

        /// Actions
        actions: [
          if ((!TDeviceUtils.isDesktopScreen(context))) IconButton(onPressed: () {}, icon: Icon(Iconsax.search_normal)),
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
          Row(
            children: [
              /// User Image
              TRoundedImage(
                width: 40,
                height: 40,
                padding: 2,
                imageType: ImageType.asset,
                image: TImages.user,
              ),

              const SizedBox(width: TSizes.sm / 2),

              /// Name & Email
              if ((!TDeviceUtils.isMobileScreen(context)))
                Obx(
                  () {
                    final user = controller.userModel.value;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isProfileLoading.value
                            ? TShimmerEffect(width: 50, height: 13)
                            : Text(user.fullName, style: Theme.of(context).textTheme.titleLarge),
                        controller.isProfileLoading.value
                            ? TShimmerEffect(width: 50, height: 13)
                            : Text(user.email, style: Theme.of(context).textTheme.labelMedium),
                      ],
                    );
                  },
                ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TSizes.appBarHeight + 15);
}
