import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../controllers/dashboard_controller.dart';

class BarGraphChart extends StatelessWidget {
  const BarGraphChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Weekly Sales
          Text('Weekly Sales', style: context.textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Graph
          SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                  titlesData: buildFlTilesData(),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(top: BorderSide.none, right: BorderSide.none),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: 200,
                  ),
                  groupsSpace: TSizes.spaceBtwItems,
                  barGroups: controller.weeklySales
                      .asMap()
                      .entries
                      .map((entry) => BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value,
                                width: 30,
                                color: TColors.primary,
                                borderRadius: BorderRadius.circular(TSizes.sm),
                              )
                            ],
                          ))
                      .toList(),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(getTooltipColor: (_) => TColors.secondary),
                    touchCallback: TDeviceUtils.isDesktopScreen(context) ? (barTouchEvent, barTouchResponse) {} : null,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  FlTitlesData buildFlTilesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            // Map index to the desired day of the week
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

            // calculate the index and ensure it wrap around for the correct day
            final index = value.toInt() % days.length;

            // get the day corresponding to the calculated index
            final day = days[index];

            return SideTitleWidget(axisSide: AxisSide.bottom, space: 0, child: Text(day));
          },
        ),
      ),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
