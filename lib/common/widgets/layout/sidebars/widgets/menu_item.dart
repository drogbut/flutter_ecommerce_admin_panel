import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../controllers /sidebar_controller.dart';

class TMenuItem extends StatelessWidget {
  final String route;
  final IconData icon;
  final String itemName;
  final VoidCallback? onTap;

  const TMenuItem({
    super.key,
    required this.itemName,
    required this.route,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SidebarController());

    return InkWell(
      onTap: onTap ?? () => controller.menuOnTap(route),
      onHover: (hovering) => hovering ? controller.changeHoverItem(route) : controller.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: controller.isHovering(route) || controller.isActive(route) ? TColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            ),
            child: Row(
              children: [
                /// Icon
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.lg, right: TSizes.md, top: TSizes.sm, bottom: TSizes.sm),
                  child: controller.isActive(route)
                      ? Icon(icon, size: 22, color: TColors.white)
                      : Icon(icon, size: 22, color: controller.isHovering(route) ? TColors.white : TColors.darkerGrey),
                ),

                /// Text
                Flexible(
                    child: Text(itemName,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          color: (controller.isHovering(route) || controller.isActive(route))
                              ? TColors.white
                              : TColors.darkerGrey,
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
