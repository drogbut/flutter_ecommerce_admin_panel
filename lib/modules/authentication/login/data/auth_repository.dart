import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  ///================ Variables ===========================================
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  ///================ GETTERS =============================================
  User? get authUser => _auth.currentUser;
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }
}
