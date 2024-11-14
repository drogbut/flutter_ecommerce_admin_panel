import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LOGO
        Image(
          height: 100,
          color: Colors.transparent,
          colorBlendMode: context.isDarkMode ? BlendMode.darken : BlendMode.lighten,
          image: AssetImage(context.isDarkMode ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Title & Sub-title
        Text(TTexts.loginTitle, style: context.textTheme.headlineSmall),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle),
      ],
    );
  }
}
