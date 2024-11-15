import 'package:flutter/material.dart';

import '../../../../../common/widgets/layout/templates/size_layout.dart';
import 'responsive_screens/desktop_tablet.dart';
import 'responsive_screens/mobile.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSizeTemplate(
      useLayout: false,
      desktop: ResetPasswordScreenDesktopTablet(),
      mobile: ResetPasswordScreenMobile(),
    );
  }
}
