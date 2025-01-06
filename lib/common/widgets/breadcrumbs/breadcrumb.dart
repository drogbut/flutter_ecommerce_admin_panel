import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants/sizes.dart';

class TBreadcrumb extends StatelessWidget {
  /// List of breadcrumb items representing the navigation path
  final List<String> breadcrumbItems;

  const TBreadcrumb({super.key, required this.breadcrumbItems});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        /// Dashboard link
        InkWell(
          onTap: () => Get.offAllNamed(TRoutes.dashboard),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.xs),
            child: Text(
              'Dashboard',
              style: context.textTheme.bodySmall?.apply(fontWeightDelta: -1),
            ),
          ),
        ),

        ///  Items links
        for (int i = 0; i < breadcrumbItems.length; i++)
          Row(
            children: [
              Text('/'), // Separator

              InkWell(
                /// Last item should not be clickable
                onTap: i == breadcrumbItems.length - 1 ? null : () => Get.offAllNamed(breadcrumbItems[i]),
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.xs),

                  /// Format breadcrumb items. Capitalize and remove '/'
                  child: Text(
                    i == breadcrumbItems.length - 1
                        ? breadcrumbItems[i].capitalizeFirst.toString()
                        : breadcrumbItems[i].substring(1).capitalizeFirst.toString(),
                    style: context.textTheme.bodySmall?.apply(fontWeightDelta: -1),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
