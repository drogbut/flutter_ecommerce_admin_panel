import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';

/// Widget for displaying different layout base of screen size
class TResponsiveWidget extends StatelessWidget {
  final Widget desktop, tablet, mobile;

  const TResponsiveWidget({super.key, required this.desktop, required this.tablet, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth >= TSizes.desktopScreenSize) {
        return desktop;
      } else if (constraints.maxWidth < TSizes.desktopScreenSize && constraints.maxWidth >= TSizes.tabletScreenSize) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
