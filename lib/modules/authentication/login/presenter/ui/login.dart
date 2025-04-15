import 'package:flutter/material.dart';

import '../../../../../common/widgets/layout/templates/size_layout.dart';
import 'responsive_screens/desktop_tablet.dart';
import 'responsive_screens/mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSizeTemplate(
      useLayout: false,
      mobile: LoginScreenMobile(),
      tablet: LoginScreenDesktopTablet(),
      desktop: LoginScreenDesktopTablet(),
    );
  }
}
