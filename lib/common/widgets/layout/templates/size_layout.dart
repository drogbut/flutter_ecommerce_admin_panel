import 'package:flutter/material.dart';

import '../../responsive/responsive_design.dart';
import '../../responsive/screens/desktop_layout.dart';
import '../../responsive/screens/mobile_layout.dart';
import '../../responsive/screens/tablet_layout.dart';

class TSizeTemplate extends StatelessWidget {
  const TSizeTemplate({super.key, this.desktop, this.tablet, this.mobile, this.useLayout = true});

  /// Widget for mobile layout
  final Widget? mobile;

  /// Widget for tablet layout
  final Widget? tablet;

  /// Widget for desktop layout
  final Widget? desktop;

  /// Flag to determine whether to use layout
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TResponsiveWidget(
        desktop: useLayout ? DesktopLayout(body: desktop) : desktop ?? const SizedBox.shrink(),
        tablet: useLayout ? TabletLayout(body: tablet ?? desktop) : tablet ?? desktop ?? const SizedBox.shrink(),
        mobile: useLayout ? MobileLayout(body: mobile ?? desktop) : mobile ?? desktop ?? const SizedBox.shrink(),
      ),
    );
  }
}
