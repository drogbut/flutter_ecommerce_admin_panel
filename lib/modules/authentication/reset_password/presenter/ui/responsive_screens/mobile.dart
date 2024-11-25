import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../widgets/reset_widget.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ResetWidget(),
        ),
      ),
    );
  }
}
