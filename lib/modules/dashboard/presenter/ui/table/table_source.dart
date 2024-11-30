import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../controllers/dashboard_controller.dart';

class OrderRows extends DataTableSource {
  final controller = Get.put(DashboardController());
  @override
  DataRow? getRow(int index) {
    final order = controller.orders[index];

    return DataRow2(
      cells: [
        DataCell(
          Text(
            order.id,
            style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(color: TColors.primary),
          ),
        ),
        DataCell(Text(order.formattedOrderDate)),
        DataCell(Text('5 Items')),
        DataCell(
          TRoundedContainer(
            radius: TSizes.cardRadiusSm,
            padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.xs),
            backgroundColor: THelperFunctions.getOrderStatusColor(order.status).withOpacity(0.2),
            child: Text(
              order.status.name.capitalize.toString(),
              style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(color: TColors.primary),
            ),
          ),
        ),
        DataCell(Text("\$ ${order.totalAmount}")),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.orders.length;

  @override
  int get selectedRowCount => 0;
}
