import 'package:get/get.dart';

import '../modules/authentication/forget_password/presenter/ui/forget_password.dart';
import '../modules/authentication/login/presenter/ui/login.dart';
import '../modules/authentication/reset_password/presenter/ui/reset_password.dart';
import '../modules/dashboard/presenter/ui/dashboard_screen.dart';
import 'route_middleware.dart';
import 'routes.dart';

class TAppRoute {
  static List<GetPage> getPages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: TRoutes.dashboard, page: () => DashboardScreen(), middlewares: [RouteMiddleWare()]),
  ];
}
