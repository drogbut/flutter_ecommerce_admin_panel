import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layout/templates/size_layout.dart';
import '../controllers/login_controller.dart';
import 'responsive_screens/desktop_tablet.dart';
import 'responsive_screens/mobile.dart';

class TLoginPage extends StatelessWidget {
  const TLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return TSizeTemplate(
      useLayout: false,
      mobile: LoginScreenMobile(),
      tablet: LoginScreenDesktopTablet(),
      desktop: LoginScreenDesktopTablet(),
    );
  }
}
