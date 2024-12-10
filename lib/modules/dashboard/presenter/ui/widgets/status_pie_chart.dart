import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/containers/circular_container.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../controllers/dashboard_controller.dart';

class OrderStatusPieChart extends StatelessWidget {
  const OrderStatusPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Orders Status
          Text('Orders Status', style: context.textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Graph
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(
                sections: controller.orderStatusData.entries.map((entry) {
                  final status = entry.key;
                  final count = entry.value;

                  return PieChartSectionData(
                    radius: 100,
                    title: count.toString(),
                    value: count.toDouble(),
                    color: THelperFunctions.getOrderStatusColor(status),
                    titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: TColors.white),
                  );
                }).toList(),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    // handle touch event if needed
                  },
                  enabled: true,
                ),
              ),
            ),
          ),

          // show status and color meta
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Orders')),
                DataColumn(label: Text('Total')),
              ],
              rows: controller.orderStatusData.entries.map(
                (entry) {
                  final status = entry.key;
                  final count = entry.value;
                  final totalAmounts = controller.totalAmounts[status] ?? 0;

                  return DataRow(cells: [
                    DataCell(
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: TCircularContainer(
                              width: 20,
                              height: 20,
                              backgroundColor: THelperFunctions.getOrderStatusColor(status),
                            ),
                          ),
                          Expanded(child: Text(controller.getDisplayStatusName(status)))
                        ],
                      ),
                    ),
                    DataCell(Text(count.toString())),
                    DataCell(Text(' \$${totalAmounts.toStringAsFixed(2)}')),
                  ]);
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
