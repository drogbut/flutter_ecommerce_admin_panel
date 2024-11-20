import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../personalization/data/models/user.dart';
import '../../../personalization/data/repositories/user_repository.dart';
import '../../../personalization/presenter/controllers/user_controller.dart';
import '../../data/auth_repository.dart';

class LoginController extends GetxController {
  /// controller needs instance & repository
  static LoginController get instance => Get.find();
  final authRepository = AuthenticationRepository.instance;

  ///================ variables ==============================================
  RxBool rememberMe = false.obs;
  RxBool hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMENBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMENBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  ///================ Email & Pwd Sign_in ====================================
  Future<void> signInWithEmailAndPassword() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Login you in...', TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        /// Show an error message if the form is invalid
        TLoaders.errorSnackBar(title: 'Error', message: 'Please fill in all required fields');
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if RememberMe is selected
      if (rememberMe.value) {
        localStorage.write('REMENBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMENBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using email and password
      await authRepository.loginWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Fetch user details and assign to userController.
      final user = await UserController.instance.fetchUserDetails();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // If user is not admin, log out and return.
      if (user.role != AppRole.admin) {
        authRepository.logout();
        TLoaders.errorSnackBar(title: 'Not authorized!', message: 'You are not authorized to have access. ');
      } else {
        authRepository.screenRedirect();
      }
    } catch (e) {
      /// Show generic error
      TLoaders.errorSnackBar(title: 'Register error', message: e.toString());
    }
  }

  ///================ Email & Pwd Sign_in ====================================
  Future<void> registerAdmin() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Registering admin account...', TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user using email and password authentication.
      await authRepository.registerWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Create admin record in fireStore.
      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(
        user: UserModel(
          id: authRepository.authUser!.uid,
          firstName: 'Drogbut',
          lastName: 'Admin',
          email: TTexts.adminEmail,
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
          role: AppRole.admin,
        ),
      );

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      authRepository.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Register error', message: e.toString());
    }
  }
}
