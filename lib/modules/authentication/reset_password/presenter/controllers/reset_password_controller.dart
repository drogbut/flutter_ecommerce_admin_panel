import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  /// controller needs instance & repository
  static ResetPasswordController get instance => Get.find();
  //final authRepository = AuthenticationRepository.instance;

  ///================ variables ========================================
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///==== Send Reset Password Email ====================================
  Future<void> sendPasswordResetEmail() async {
    /*try {
      /// Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.deliveredInPlaneIllustration);

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
      TLoaders.successSnackbar(title: 'Email send', message: 'Email link send to reset you password');

      /// Redirect
      Get.offAll(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'Oh error', message: e.toString());
    }*/
  }

  ///================ Reset Email ====================================
  Future<void> resentPassword({required String email}) async {
    /*try {
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
      TLoaders.successSnackbar(title: 'Email send', message: 'Email link send to reset your password');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'Oh error', message: e.toString());
    }*/
  }
}
