import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/utils/extensions/context.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/buttons/primary.dart';
import '../../../../../../common/widgets/buttons/secondary.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class ResetWidget extends StatelessWidget {
  const ResetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments ?? 'Something wrong with email';

    return Column(
      children: [
        /// Header
        Row(
          children: [
            IconButton(
                onPressed: () => Get.offAllNamed(TRoutes.login),
                icon: Icon(CupertinoIcons.clear, color: context.whiteOrBlack)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Image
        Image(image: AssetImage(TImages.deliveredEmailIllustration), width: 300, height: 300),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Title & Sub-title
        Text(TTexts.changeYourPasswordTitle, style: context.textTheme.headlineSmall),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(email, style: context.textTheme.labelLarge),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.changeYourPasswordSubTitle, textAlign: TextAlign.center),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Buttons
        TPrimaryButton(
          title: TTexts.done,
          onPressed: () => Get.offAllNamed(TRoutes.login),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        TSecondaryButton(title: TTexts.resendEmail, onPressed: () {}),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
