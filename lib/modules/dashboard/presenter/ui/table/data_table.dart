import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/data_table/paginated_data_table.dart';
import '../../../../../utils/constants/sizes.dart';
import 'table_source.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent orders', style: context.textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          TPaginatedDataTable(
            minWidth: 700,
            tableHeight: 500,
            dataRowHeight: TSizes.xl * 1.2,
            columns: [
              DataColumn2(label: Text('Order ID')),
              DataColumn2(label: Text('Date')),
              DataColumn2(label: Text('Items')),
              DataColumn2(label: Text('Status')),
              DataColumn2(label: Text('Amount')),
            ],
            source: OrderRows(),
          ),
        ],
      ),
    );
  }
}
