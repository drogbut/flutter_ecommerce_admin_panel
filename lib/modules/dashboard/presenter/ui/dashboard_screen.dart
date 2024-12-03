import 'package:flutter/material.dart';

import '../../../../../common/widgets/layout/templates/size_layout.dart';
import 'responsive_screens/desktop.dart';
import 'responsive_screens/mobile.dart';
import 'responsive_screens/tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSizeTemplate(
      mobile: DashboardScreenMobile(),
      tablet: DashboardScreenTablet(),
      desktop: DashboardScreenDesktop(),
    );
  }
}
