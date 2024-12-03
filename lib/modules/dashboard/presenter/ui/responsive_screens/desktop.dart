import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../table/data_table.dart';
import '../widgets/bar_graph_chart.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreenDesktop extends StatelessWidget {
  const DashboardScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Dashboard
            Text('Dashboard', style: context.textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(child: DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25')),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(child: DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25')),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(child: DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25')),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(child: DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25')),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      /// Bar Graph
                      BarGraphChart(),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Orders
                      Text('Recent orders', style: context.textTheme.headlineSmall),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const DashboardOrderTable(),
                    ],
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwSections),
                Expanded(
                  child: TRoundedContainer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
