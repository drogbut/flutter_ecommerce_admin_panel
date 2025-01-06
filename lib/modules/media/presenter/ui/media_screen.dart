import 'package:flutter/material.dart';

import '../../../../../common/widgets/layout/templates/size_layout.dart';
import 'responsive_screens/desktop.dart';
import 'responsive_screens/mobile.dart';
import 'responsive_screens/tablet.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSizeTemplate(
      mobile: MediaScreenMobile(),
      tablet: MediaScreenTablet(),
      desktop: MediaScreenDesktop(),
    );
  }
}
