import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/sizes.dart';
import '../table/data_table.dart';
import '../widgets/bar_graph_chart.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/status_pie_chart.dart';

class DashboardScreenTablet extends StatelessWidget {
  const DashboardScreenTablet({super.key});

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
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            Row(
              children: [
                Expanded(child: DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25')),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(child: DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25')),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Bar Graph
            BarGraphChart(),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Orders
            const DashboardOrderTable(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Pie Graph
            OrderStatusPieChart(),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
