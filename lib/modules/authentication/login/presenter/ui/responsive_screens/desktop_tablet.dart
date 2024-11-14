import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/common/styles/spacing_styles.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';

import '../widgets/header.dart';
import '../widgets/login_form.dart';

class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

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
                  const LoginHeader(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Form
                  const LoginForm(),
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
