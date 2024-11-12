import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/routes/routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RouteMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = true;
    return isAuthenticated ? null : const RouteSettings(name: TRoutes.login);
  }
}
