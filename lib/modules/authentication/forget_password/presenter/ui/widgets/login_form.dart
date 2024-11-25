import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/buttons/primary.dart';
import '../../../../../../common/widgets/text_fields/primary.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../controllers/forget_password_controller.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Form(
      key: controller.forgetPasswordFormKey,
      child: Column(
        children: [
          /// E-mail field
          TPrimaryTextField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            prefixIcon: Iconsax.direct_right,
            label: TTexts.email,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Submitted button
          TPrimaryButton(
            title: TTexts.submit,
            onPressed: () => Get.toNamed(
              TRoutes.resetPassword,
              arguments: controller.email.text,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
