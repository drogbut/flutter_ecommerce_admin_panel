import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../login/data/auth_repository.dart';

class ForgetPasswordController extends GetxController {
  /// controller needs instance & repository
  static ForgetPasswordController get instance => Get.find();
  final authRepository = AuthenticationRepository.instance;

  ///================ variables ========================================
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///==== Send Reset Password Email ====================================
  Future<void> sendPasswordResetEmail() async {
    try {
      /// Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send Email to reset password
      await authRepository.sendPasswordResetEmail(email: email.text.trim());

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Show success screen
      TLoaders.successSnackBar(title: 'Email send', message: 'Email link send to reset you password');

      /// Redirect
      Get.offAllNamed(TRoutes.login);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh error', message: e.toString());
    }
  }

  ///================ Reset Email ====================================
  Future<void> resentPassword({required String email}) async {
    try {
      /// Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.deliveredInPlaneIllustration);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send Email to reset password
      await authRepository.sendPasswordResetEmail(email: email);

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Show success screen
      TLoaders.successSnackBar(title: 'Email send', message: 'Email link send to reset your password');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh error', message: e.toString());
    }
  }
}
