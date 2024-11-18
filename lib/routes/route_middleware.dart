import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/routes/routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../modules/authentication/login/data/auth_repository.dart';

class RouteMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated ? null : const RouteSettings(name: TRoutes.login);
  }
}
