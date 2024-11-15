import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/styles/spacing_styles.dart';
import '../../../../../../common/widgets/buttons/primary.dart';
import '../../../../../../common/widgets/buttons/secondary.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/extensions/context.dart';

class ResetPasswordScreenDesktopTablet extends StatelessWidget {
  const ResetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Container(
              padding: TSpacingStyle.paddingWithAppBarHeight,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(TSizes.cardRadiusLg), color: TColors.white),
              child: Column(
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
                  const SizedBox(height: TSizes.sm),
                  Text(TTexts.changeYourPasswordSubTitle, textAlign: TextAlign.center),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Buttons
                  TPrimaryButton(title: TTexts.done, onPressed: () => Get.offAllNamed(TRoutes.login)),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSecondaryButton(title: TTexts.resendEmail, onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
