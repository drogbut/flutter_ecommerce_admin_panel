import 'package:flutter/material.dart';

import '../../../../../../common/styles/spacing_styles.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../widgets/header.dart';
import '../widgets/login_form.dart';

class ForgetPasswordScreenMobile extends StatelessWidget {
  const ForgetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Container(
              padding: TSpacingStyle.paddingWithAppBarHeight,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(TSizes.cardRadiusLg), color: TColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Header - logo, title and sub-title
                  const ForgetPasswordHeader(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Form
                  const ForgetPasswordForm(),
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
