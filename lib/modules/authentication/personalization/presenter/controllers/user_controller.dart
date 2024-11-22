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
  Rx<bool> isProfileLoading = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Fetch user data
  Future<UserModel> fetchUserDetails() async {
    try {
      isProfileLoading.value = true;
      final user = await userRepository.fetchAdminDetails();
      userModel.value = user;
      isProfileLoading.value = false;
      return user;
    } catch (e) {
      isProfileLoading.value = false;
      TLoaders.errorSnackBar(title: 'Something is wrong...', message: e.toString());
      return UserModel.empty();
    }
  }
}
