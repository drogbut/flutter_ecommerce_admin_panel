import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/extensions/context.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left, color: context.whiteOrBlack)),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Title & Sub-title
        Text(TTexts.forgetPasswordTitle, style: context.textTheme.headlineSmall),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.forgetPasswordSubTitle),
      ],
    );
  }
}
