import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  /// The global key to access of Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
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
                  decoration:
                      InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: TTexts.homeAppbarSearchText),
                ))
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coding with Drogbut',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      TTexts.adminEmail,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TSizes.appBarHeight + 15);
}
