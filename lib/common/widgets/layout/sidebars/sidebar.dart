import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../images/t_circular_image.dart';
import 'models/menu_item.dart';
import 'widgets/menu_item.dart';

class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(side: BorderSide(color: TColors.grey, width: 1)),
      elevation: 0.0,
      child: Container(
        decoration: BoxDecoration(
          color: TColors.white,
          border: Border(right: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            /// Logo
            TCircularImage(
              fit: BoxFit.contain,
              width: 150,
              height: 150,
              image: context.isDarkMode ? TImages.lightAppLogo : TImages.darkAppLogo,
              backgroundColor: Colors.transparent,
            ),

            /// Generate menu items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Text('MENU',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: TColors.darkerGrey,
                  )),
            ),
            ...MenuItem.defaultMenuItems().map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                child: TMenuItem(
                  itemName: item.itemName,
                  route: item.route,
                  icon: item.icon,
                ),
              ),
            ),

            /// Generate other items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Text('OTHER',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: TColors.darkerGrey,
                  )),
            ),
            ...MenuItem.settingsMenuItems().map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                child: TMenuItem(
                  itemName: item.itemName,
                  route: item.route,
                  icon: item.icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
