import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class HeaderMedia extends StatelessWidget {
  const HeaderMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Breadcrumbs
        TBreadcrumbsWithHeading(
          heading: 'Media',
          breadcrumbItems: [],
        ),

        /// upload button
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
            horizontal: TSizes.md,
            vertical: TSizes.sm,
          )),
          onPressed: () {},
          label: Text('Upload images'),
          icon: Icon(Iconsax.cloud_add),
        ),
      ],
    );
  }
}
