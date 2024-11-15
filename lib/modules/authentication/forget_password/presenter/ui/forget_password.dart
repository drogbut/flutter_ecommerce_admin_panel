import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/modules/authentication/forget_password/presenter/ui/responsive_screens/desktop_tablet.dart';
import 'package:flutter_ecommerce_admin_panel/modules/authentication/forget_password/presenter/ui/responsive_screens/mobile.dart';

import '../../../../../common/widgets/layout/templates/size_layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSizeTemplate(
      useLayout: false,
      mobile: ForgetPasswordScreenMobile(),
      tablet: ForgetPasswordScreenDesktopTablet(),
      desktop: ForgetPasswordScreenDesktopTablet(),
    );
  }
}
