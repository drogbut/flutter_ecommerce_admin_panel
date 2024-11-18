import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// controller needs instance & repository
  static LoginController get instance => Get.find();
  //final authRepository = AuthenticationRepository.instance;

  //final userController = Get.put(UserController());

  ///================ variables ========================================
  RxBool rememberMe = false.obs;
  RxBool hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /*///================ Email & Pwd Sign_in ====================================
  Future<void> signInWithEmailAndPassword() async {
    try {
      /// Start loading
      //TFullScreenLoader.openLoadingDialog('Login you in...', TImages.verifyIllustration);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!loginFormKey.currentState!.validate()) {
        /// Show an error message if the form is invalid
        TLoaders.errorSnackbar(title: 'Error', message: 'Please fill in all required fields');
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Save data if RememberMe is selected
      if (rememberMe.value) {
        localStorage.write('REMENBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMENBER_ME_PASSWORD', password.text.trim());
      }

      /// Login user using email and password
      await authRepository.loginWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Redirect
      authRepository.screenRedirect();
    } catch (e) {
      /// Show generic error
      TLoaders.errorSnackbar(title: 'Register error', message: e.toString());
    }
  }

  ///================ GOOGLE SIGN IN ========================================
  Future<void> googleSignIn() async {
    try {
      /// Start loading
      //TFullScreenLoader.openLoadingDialog('Login you in...', TImages.verifyIllustration);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Login user using google
      final credential = await authRepository.signInWithGoogle();

      /// Save user data
      await userController.saveUserRecord(credential);

      /// Remove loader
      //TFullScreenLoader.stopLoading();

      /// Redirect
      authRepository.screenRedirect();
    } catch (e) {
      /// Remove loader
      //TFullScreenLoader.stopLoading();
      /// Show generic error
      TLoaders.errorSnackbar(title: 'Register error', message: e.toString());
    }
  }*/
}
