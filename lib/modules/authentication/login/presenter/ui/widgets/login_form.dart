import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/buttons/primary.dart';
import '../../../../../../common/widgets/buttons/tertiary.dart';
import '../../../../../../common/widgets/checkboxes/checkbox.dart';
import '../../../../../../common/widgets/text_fields/primary.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          /// E-mail
          TPrimaryTextField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            prefixIcon: Iconsax.direct_right,
            label: TTexts.email,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Password
          Obx(
            () => TPrimaryTextField(
              controller: controller.password,
              validator: (value) => TValidator.validateEmptyText('Password', value),
              isObscureText: controller.hidePassword.value,
              prefixIcon: Iconsax.password_check,
              label: TTexts.password,
              suffixIcon: IconButton(
                onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Remember me & forgot password
          Row(
            children: [
              /// Remember Me
              Obx(
                () => TCheckBoxListTile(
                  title: TTexts.rememberMe,
                  value: controller.rememberMe.value,
                  onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                ),
              ),

              /// Forgot password
              TTertiaryButton(
                title: '${TTexts.forgetPassword} ?',
                onPressed: () => Get.toNamed(TRoutes.forgetPassword),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// SignIn button
          TPrimaryButton(
            title: TTexts.signIn,
            onPressed: () {},
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
