import 'package:flutter/material.dart';

import '../../../../../common/widgets/layout/templates/size_layout.dart';
import 'responsive_screens/desktop_tablet.dart';
import 'responsive_screens/mobile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSizeTemplate(
      mobile: DashboardScreenMobile(),
      tablet: DashboardScreenDesktopTablet(),
      desktop: DashboardScreenDesktopTablet(),
    );
  }
}
