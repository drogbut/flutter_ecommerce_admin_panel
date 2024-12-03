import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../table/data_table.dart';
import '../widgets/bar_graph_chart.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreenMobile extends StatelessWidget {
  const DashboardScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Dashboard
              Text('Dashboard', style: context.textTheme.headlineSmall),
              const SizedBox(height: TSizes.spaceBtwItems),
              DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25'),
              const SizedBox(height: TSizes.spaceBtwItems),
              DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25'),
              const SizedBox(height: TSizes.spaceBtwItems),
              DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25'),
              const SizedBox(height: TSizes.spaceBtwItems),
              DashboardCard(title: 'Sales Total', subtitle: '\$365.5', stats: '25'),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Bar Graph
              BarGraphChart(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Orders
              Text('Recent orders', style: context.textTheme.headlineSmall),
              const SizedBox(height: TSizes.spaceBtwItems),
              const DashboardOrderTable(),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
