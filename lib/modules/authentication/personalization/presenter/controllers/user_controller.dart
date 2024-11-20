import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/popups/loaders.dart';
import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class UserController extends GetxController {
  /// controller needs instance & repositories
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  ///================ Variables ===========================================
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<bool> isProfileLoaded = false.obs;
  RxBool hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  /// Fetch user data
  Future<UserModel> fetchUserDetails() async {
    try {
      final user = await userRepository.fetchAdminDetails();
      return user;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Something is wrong...', message: e.toString());
      return UserModel.empty();
    }
  }
}
