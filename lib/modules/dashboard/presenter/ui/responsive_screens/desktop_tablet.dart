import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../table/data_table.dart';

class DashboardScreenDesktopTablet extends StatelessWidget {
  const DashboardScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Container(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(TSizes.cardRadiusLg), color: TColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Orders
              Text('Recent orders', style: context.textTheme.headlineSmall),
              const SizedBox(height: TSizes.spaceBtwSections),
              const DashboardOrderTable(),
            ],
          ),
        ),
      ),
    );
  }
}
